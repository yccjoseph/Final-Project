classdef Mobile
    properties
        pos_x;
        pos_y;
        current_id;
        mv_angle;
        mv_speed;
        minT;
        maxT;
        minspeed;
        maxspeed;
        mv_time;
    end
    methods
        function M = Mobile(id , x , y , minT , maxT , minspeed , maxspeed)
            M.current_id = id;
            M.pos_x = x;
            M.pos_y = y;
            M.minT = minT;
            M.maxT = maxT;
            M.minspeed = minspeed;
            M.maxspeed = maxspeed;
        end
        
        function M = move(M)
            M.mv_angle = rand*2*pi;
            M.mv_speed = rand*(M.maxspeed - M.minspeed) + M.minspeed;
            M.mv_time = rand*(M.maxT - M.minT) + M.minT;
        end
    end
end