Target = Class{}

color = {1, 1, 1, 1}
--=============================================================================================================================================================================================
function Target:init(x, y, width, height)
    self.x = x 
    self.y = y 
    self.width = width
    self.height = height
    self.target_hot = false
    self.target_hit = false
end

--=============================================================================================================================================================================================
function Target:update(dt)
    mX, mY = love.mouse.getPosition()
    target:hot()
    target:hit()
    target:reset()
end

--=============================================================================================================================================================================================

function Target:hot()
    if mX > TARGET_X and mX < TARGET_X + TARGET_WIDTH and mY > TARGET_Y and mY < TARGET_Y + TARGET_HEIGHT then
        self.target_hot = true
    else
        self.target_hot = false
    end

end

--=============================================================================================================================================================================================
function Target:hit()
    if self.target_hot and love.mouse.isDown(1) then
        self.target_hit = true
        love.timer.sleep(0.2)
        Score = Score + 1
        target_hit_sound:play()
    else
        self.target_hit = false
    end
    
end
--=============================================================================================================================================================================================
function Target:reset()
    if self.target_hit then
        TARGET_X = math.random(0, WINDOW_WIDTH - TARGET_WIDTH)
        TARGET_Y = math.random(32, WINDOW_HEIGHT - TARGET_HEIGHT)
    end

end
--=============================================================================================================================================================================================
function Target:draw()

    love.graphics.setColor(unpack(color))
    love.graphics.rectangle('fill', TARGET_X, TARGET_Y, TARGET_WIDTH, TARGET_HEIGHT)

    if target.target_hot then
        love.graphics.setLineWidth(ROI_THICKNESS)
        love.graphics.setColor({255,0,0})
        love.graphics.rectangle("line", TARGET_X - ROI_THICKNESS, TARGET_Y - ROI_THICKNESS, TARGET_WIDTH + (2 * ROI_THICKNESS), TARGET_HEIGHT + (2 * ROI_THICKNESS) )

    end

end

--=============================================================================================================================================================================================