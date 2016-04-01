%Author: Steven	Date: 20150214
function [] = marketclose(rit)

    rit.clearQueuedOrders;
    id = getOrders(rit);
	rit.cancelOrder(id);




    if rit.pooh_position == 0
        ;
    else
        if abs(rit.pooh_position) > 500
            
            if rit.pooh_position > 0
                sell(rit,'pooh',500)
            else
                buy(rit,'pooh',500);
            end
            
        else
            
            if rit.pooh_position > 0
                sell(rit,'pooh',rit.pooh_position)
            else
                buy(rit,'pooh',rit.pooh_position);
            end
        end
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if rit.tigr_position == 0
        ;
    else
        if abs(rit.tigr_position) > 500
            
            if rit.tigr_position > 0
                sell(rit,'tigr',500)
            else
                buy(rit,'tigr',500);
            end
            
        else
            
            if rit.tigr_position > 0
                sell(rit,'tigr',rit.tigr_position)
            else
                buy(rit,'tigr',rit.tigr_position);
            end
        end
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
     if rit.eyor_position == 0
        ;
    else
        if abs(rit.eyor_position) > 500
            
            if rit.eyor_position > 0
                sell(rit,'eyor',500)
            else
                buy(rit,'eyor',500);
            end
            
        else
            
            if rit.eyor_position > 0
                sell(rit,'eyor',rit.eyor_position)
            else
                buy(rit,'eyor',rit.eyor_position);
            end
        end
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
    if rit.huny_position == 0
        ;
    else
        if abs(rit.huny_position) > 500
            
            if rit.huny_position > 0
                sell(rit,'huny',500)
            else
                buy(rit,'huny',500);
            end
            
        else
            
            if rit.huny_position > 0
                sell(rit,'huny',rit.huny_position)
            else
                buy(rit,'huny',rit.huny_position);
            end
        end
    end
    
end