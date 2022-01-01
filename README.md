# SHOOTING_TRAINER_V1.0

#### Video Demo:  <https://youtu.be/B9AIf9_I2Uw>

#### Description: 
    --> Author: Rajat Pratap Singh Bisht
    --> This is a training tool for FPV Shooting 
    games enthusiasts to improve their shooting accuracy and gain more control over their mouse movements.
    --> Target changes its location randomly after it is hit.
    --> Howering over the target area creates a ROI (Region 
    of Interest) around the target marking it as "Target: HOT"
    --> Left clicking on the target increases the score and 
    counts it as "Target: HIT"
    --> Time counter runs and is shown on top right corner
     under score showing countdown to ending of a session.
    --> After playing session ends, user score (counts of 
    Hits) and hitting speed (in hits/sec) is published and
     game can be reset.
     
    
    File Description:

    Main File (main.lua):
    --> This file contains graphics initialisation, timer 
    and intial game setup.
    --> Hit sound can be edited if someone desires, by 
    changing input file path where sound object is created.
    --> Size of the target is also flexible and could be 
    edited by changing 'TARGET_SIZE' variable.
    --> Timer Countdown could be shortened or increased by
     changing 'GAMEPLAY_TIME' variable.
    --> ROI around the target implying target:HOT, doesn't
     need modification as it is autonomous in its own functionality.
     font chioice was 
    --> font choice is 
    
    Target Object File (Target.lua)
    --> Taget is initialised by passsing its size and location.
    --> Function target_hot determines whether the mouse 
    pointer is hovering above it or not and creates a ROI 
    around it.
    --> Function target_hit registers mouse click as target
     hit, if it is on the target area and updates scores.
    --> Function target_reset is used to reset target location
     at a new and random cartesian coordinates after its hit.
