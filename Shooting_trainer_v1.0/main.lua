--[[
    Shooting_Trainer_v1.0 : sound and timer update
    Author: Rajat Pratap Singh Bisht
    Shooting Trainer is a practice game for shooting practice for FPV shooting games.
    --> target appers at random spots.
    --> when mouse hovers on the target, it is considered "Hot" or "Armed"
    --> if clicked on the target then it will record as "Target HIT" and Score increases

]]
--=============================================================================================================================================================================================
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

TARGET_X = 0
TARGET_Y = 0

TARGET_SIZE = 25       --RECOMMENDED AT 25
TARGET_WIDTH = TARGET_SIZE
TARGET_HEIGHT = TARGET_SIZE

ROI_THICKNESS = 3

GAMEPLAY_TIME = 40     --IN SECONDS

--[[
    include class.lua library file
    --> for object oriented programming implimentation
]]
Class = require 'class'

--[[
    include Target.lua file
    -->object class for targets
    --> in later iterations player can have more than one targets to hit at a time
]]
require 'Target'


--=============================================================================================================================================================================================
function love.load()
    
    love.window.setTitle("Shooting Trainer by BishTECH")

    --[[
        Set nearest-neighbour filtering on upscaling / downscaling of test to prevent blurring
    ]]
    love.graphics.setDefaultFilter('nearest', 'nearest')
    
    --setting up smaller font object
    smallFont = love.graphics.newFont('font.ttf', 32)

    -- setting up score font object
    scoreFont = love.graphics.newFont('font.ttf', 20)

    -- create sound object for target hit
    target_hit_sound = love.audio.newSource('hit.wav', 'static')

    --Randomize target position
    math.randomseed(os.time())
    
    TARGET_X = math.random(0, WINDOW_WIDTH - TARGET_WIDTH)
    TARGET_Y = math.random(32, WINDOW_HEIGHT - TARGET_HEIGHT)
    
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT,{
        fullscreen = false,
        vsync = true,
        resizable = false
    })

    target = Target(TARGET_X, TARGET_Y, TARGET_WIDTH, TARGET_HEIGHT)
    
    --setting game flags
    gameState = 'start'

    Score = 0
    Timer = GAMEPLAY_TIME    --in seconds, game play stops when timer reaches 0

end
--=============================================================================================================================================================================================

function love.update(dt)
    if gameState == 'play' then
        target:update(dt) 
        --update time
        if Timer > 0 then
            Timer = Timer - dt
        else
            Timer = 0
            gameState = 'score_card'
        end
    end
    
    
    
end
--=============================================================================================================================================================================================

function love.keypressed(key)
    
    if key == 'escape' then
        --function to terminate game
        love.event.quit()
    
    elseif key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'play'
            Timer = GAMEPLAY_TIME
            Score = 0

        elseif gameState == 'score_card' then
            gameState = 'start'

        end

    end

end
--=============================================================================================================================================================================================
function love.draw()
    --background screen
    love.graphics.clear(40/255, 45/255, 52/255, 255/255)    --[r,g,b,a]

    -- initializing game requirements
    if gameState == 'start' then
        love.graphics.setFont(smallFont)
        love.graphics.printf("Welcome to SHOOTING TRAINNR", 0, 50, WINDOW_WIDTH, 'center')
        love.graphics.printf("Press 'ENTER' to PLAY", 0, 150, WINDOW_WIDTH, 'center')
        love.graphics.printf("Press 'ESCAPE' to QUIT " , 0, 250, WINDOW_WIDTH, 'center')

    elseif gameState == 'play' then
        target:draw()
        --establishing score font for score o/p
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.setFont(scoreFont)
        love.graphics.print("SCORE : " .. tostring(Score) .. " ", WINDOW_WIDTH - 160, 0)
        love.graphics.print("TIMER : " .. tostring(Timer) .. " ", WINDOW_WIDTH - 160, 20)
    
    elseif gameState == 'score_card' then
        love.graphics.setFont(smallFont)
        love.graphics.printf("you scored : " .. tostring(Score).. " ", 0, 50, WINDOW_WIDTH, 'center')
        love.graphics.printf("average target speed : " .. tostring(Score / GAMEPLAY_TIME ) .. " hits/sec", 0, 150, WINDOW_WIDTH, 'center')
        love.graphics.printf("Press 'ENTER' to CONTINUE " , 0, 250, WINDOW_WIDTH, 'center')
        
    end
    
end
--=============================================================================================================================================================================================