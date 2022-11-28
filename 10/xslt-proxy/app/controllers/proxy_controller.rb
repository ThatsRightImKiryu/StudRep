# frozen_string_literal: false

require 'nokogiri'
require 'open-uri'
# Docs
class ProxyController < ApplicationController
  def input; end

  def output
    unless check(@input = params[:inpt]).nil?
      return redirect_to '/proxy/input',
                         notice: check(@input)
    end
    api_response = URI.open("http://localhost:3000/?inpt=#{@input}&format=xml")
    case params[:side]
    when 'server'
      @result = xslt_transform(api_response).to_html
    when 'client-with-xslt'
      render xml: insert_browser_xslt(api_response).to_xml
    when 'client'
      render xml: api_response
    end
  end

  def where(side, api_response)
    case side
    when 'server'
      @result = xslt_transform(api_response).to_html
    when 'client-with-xslt'
      render xml: insert_browser_xslt(api_response).to_xml
    when 'client'
      render xml: api_response
    end
  end

  def xslt_transform(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read("#{Rails.root}/public/server_transform.xslt"))
    xslt.transform(doc)
  end

  def insert_browser_xslt(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc,
                                                    'xml-stylesheet',
                                                    'type="text/xsl" href="/browser_transform.xslt"')
    doc.root.add_previous_sibling(xslt)
    # Возвращаем doc, так как предыдущая операция возвращает не XML-документ.
    doc
  end

  def check(input)
    return 'Введено не число' unless /^-?\d+$/.match(input)
    return 'Введено отрицательное число' unless input.to_i.positive?

    nil
  end
end
