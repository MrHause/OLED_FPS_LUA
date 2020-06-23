lighton=0
pin=7
FPS_Curr=0
FPS=0
gpio.mode(pin,gpio.OUTPUT)
function init_i2c_display()
    -- SDA and SCL can be assigned freely to available GPIOs
    local sda = 2 -- GPIO14
    local scl = 1 -- GPIO12
    local sla = 0x3c
    i2c.setup(0, sda, scl, i2c.SLOW)
    --disp = u8g2.ssd1306_i2c_128x64_noname(0, sla)
    disp = u8g2.sh1106_i2c_128x64_noname(0, sla)
end
function u8g2_prepare()
  disp:setFont(u8g2.font_6x10_tf)
  disp:setFontRefHeightExtendedText()
  disp:setDrawColor(1)
  disp:setFontPosTop()
  disp:setFontDirection(0)
end

function u8g2_string(a)
  disp:setFontDirection(0)
  temp = tostring(FPS)
  disp:drawStr(3,15, temp)

end

function draw()
  u8g2_string(d7)
end


function loop()
  -- picture loop
  disp:clearBuffer()
  temp = tostring(FPS)
  disp:drawStr(3,15, temp)
  disp:sendBuffer()
  FPS_Curr = FPS_Curr + 1
  loop_tmr:start()
end


draw_state = 0
loop_tmr = tmr.create()
loop_tmr:register(1, tmr.ALARM_SEMI, loop)

init_i2c_display()
u8g2_prepare()
tmr.create():alarm(1000,tmr.ALARM_AUTO,function()
    FPS = FPS_Curr
    FPS_Curr = 0
end)
loop_tmr:start()


