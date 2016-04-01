function [q,a] = close(rit)

    id = getOrders(rit);
	rit.cancelOrder(id);
	rit.clearQueuedOrders;


a = {0;'1';'1';'1'};
    if rit.pooh_position == 0
        q(1) = 0;
    else
        if abs(rit.pooh_position) > 500
            
            q(1) = 500;
            if rit.pooh_position > 0
                a(1) = {'Sell'};
            else
                a(1) = {'Buy'};
            end
            
        else
            
            q(1) = rit.pooh_position;
            if rit.pooh_position > 0
                a(1) = {'Sell'};
            else
                a(1) = {'Buy'};
            end
        end
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if rit.tigr_position == 0
        q(2) = 0;
    else
        if abs(rit.tigr_position) > 500
            
            q(2) = 500;
            if rit.tigr_position > 0
                a(2) = {'Sell'};
            else
                a(2) = {'Buy'};
            end
            
        else
            
            q(2) = rit.tigr_position;
            if rit.tigr_position > 0
                a(2) = {'Sell'};
            else
                a(2) = {'Buy'};
            end
        end
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    if rit.eyor_position == 0
        q(3) = 0;
    else
        if abs(rit.eyor_position) > 500
            
            q(3) = 500;
            if rit.eyor_position > 0
                a(3) = {'Sell'};
            else
                a(3) = {'Buy'};
            end
            
        else
            
            q(3) = rit.eyor_position;
            if rit.eyor_position > 0
                a(3) = {'Sell'};
            else
                a(3) = {'Buy'};
            end
        end
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
    if rit.huny_position == 0
        q(4) = 0;
    else
        if abs(rit.huny_position) > 500
            
            q(4) = 500;
            if rit.huny_position > 0
                a(4) = {'Sell'};
            else
                a(4) = {'Buy'};
            end
            
        else
            
            q(4) = rit.huny_position;
            if rit.huny_position > 0
                a(4) = {'Sell'};
            else
                a(4) = {'Buy'};
            end
        end
    end


end