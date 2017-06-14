pos_x = [121.579430 , 121.573145 , 121.568102 , 121.558201 , 121.557052 , 121.558791 , 121.553004 , 121.543437 , 121.543584 ...
         121.543757 , 121.544040 , 121.544226 , 121.551995 , 121.546894 , 121.555592 , 121.567212 , 121.575079 , 121.585064 ...
         121.594407 , 121.602143 , 121.607620 , 121.611452 , 121.615952 , 121.617852];%longitude
pos_y = [24.998259 , 24.998240 , 24.998585 , 24.999389 , 25.005243 , 25.018535 , 25.023739 , 25.026124 , 25.032928 ...
         25.040958 , 25.052241 , 25.060848 , 25.063004 , 25.079476 , 25.084853 , 25.082148 , 25.080031 , 25.078530 ...
         25.083660 , 25.083841 , 25.072504 , 25.067123 , 25.059904 , 25.055405];%latitude

x = zeros(1 , 24);
y = zeros(1 , 24);
MRT_s = cell(1 , 24);
for i = 1:23
    x(1 , i+1) = great_circle(pos_y(1 , i) , pos_x(1 , i) , pos_y(1 , i) , pos_x(1 , i+1));
    y(1 , i+1) = great_circle(pos_y(1 , i) , pos_x(1 , i) , pos_y(1 , i+1) , pos_x(1 , i));
end
mrt_x = zeros(1 , 24);
mrt_y = zeros(1 , 24);
for i = 1:23
    if pos_x(1 , i+1) > pos_x(1 , i)
        mrt_x(1 , i+1) = mrt_x(1 , i) + x(1 , i+1);
    else mrt_x(1 , i+1) = mrt_x(1 , i) - x(1 , i+1);
    end
    if pos_y(1 , i+1) > pos_y(1 , i)
        mrt_y(1 , i+1) = mrt_y(1 , i) + y(1 , i+1);
    else mrt_y(1 , i+1) = mrt_y(1 , i) - y(1 , i+1);
    end
end
for_orientation = zeros(1 , 24); % forward direction
%{
for i = 1:23
    for_orientation(1 , i) = atan((mrt_y(1 , i+1) - mrt_y(1 , i) )/ ((mrt_x(1 , i+1) - mrt_x(1 , i) ))) + pi;%denote ith to (i+1)th
    back_orientation(1 , i+1) = for_orientation(1 , i) - pi;
end
%}
for i = 1:24
    MRT_s{1 , i} = MRT_station(mrt_x(1 , i) , mrt_y(1 , i) , i);
end
