str = "2022"
str2 = "2022-32-22"
reg_exp = /^2[0-9]{3}[-]0[1-9][-]0[1-9]$|^2[0-9]{3}[-]1[0-2][-]0[1-9]$|^2[0-9]{3}[-]0[1-9][-][1-3][0-9]$|^2[0-9]{3}[-]1[0-2][-][1-3][0-9]$/

p str.match(reg_exp)
p str2.match(reg_exp)