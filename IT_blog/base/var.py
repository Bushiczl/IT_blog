chNum = "0123456789"
chAlphaLow = "qwertyuiopasdfghjklzxcvbnm"
chAlphaHigh = "QWERTYUIOPASDFGHJKLZXCVBNM"

pageMaxnum = 10

identifyName = 'identify.png'
identifyDir = 'tmp/'
identifyPath = identifyDir + identifyName

# 生成几位数的验证码
identifyLen = 4

# 生成验证码图片的高度和宽度
identifySize = (80, 30)

# 背景颜色，默认为白色
identifyBgcolor = (255, 255, 255)

# 字体颜色，默认为蓝色
identifyFontcolor = (0, 0, 255)

# 干扰线颜色。默认为红色
identifyLinecolor = (255, 0, 0)

# 是否要加入干扰线
identifyDraw_line = True

# 加入干扰线条数的上限
identifyLine_number = 5
