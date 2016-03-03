%Author: Steven	Date: 20150216
function [g, l, p] = rsi(rit, gain, loss, price)
    
    p = rit.huny_last;
        
    if rit.timeRemaining > 270

        delta = p - price;
        if delta >= 0
            gain(end+1) = delta;
            loss(end+1) = 0;
        else
            loss(end+1) = delta;
            gain(end+1) = 0;
        end    
          
    end
    
    if rit.timeRemaining <= 270
        %{
        if (rit.timeRemaining >= 75 && rit.timeRemaining <= 78) || (rit.timeRemaining >= 225 && rit.timeRemaining <= 228)
            if rit.huny_position > 0;
                sell()
            else
                buy()
            end
        end
%}
        avg_gain = sum(gain(end-13:end)) / 14;
        avg_loss = sum(loss(end-13:end)) / 14;
        rsindex_pre = 100 - (100 / (1 + (avg_gain / avg_loss)));

        delta = p - price;
        if delta >= 0
            gain(end+1) = delta;
            loss(end+1) = 0;
        else
            loss(end+1) = -delta;
            gain(end+1) = 0;
        end
        
    avg_gain = (avg_gain*13 + gain(end)) / 14;
    avg_loss = (avg_loss*13 + loss(end)) / 14;

    rsindex = 100 - (100 / (1 + (avg_gain / avg_loss)))

        if rsindex >= 70
            if rsindex == 100 && rit.huny_position < 2000 
                mb = buy(rit, 'HUNY', 1000)
            elseif rsindex_pre < 70
                lb = limitOrder(rit, 'HUNY', 1000, rit.huny_bid + 0.01)
            else
                lb = limitOrder(rit, 'HUNY', 100, rit.huny_bid + 0.01)
            end

        elseif rsindex < 70 && rsindex_pre > 70 
             
            if rit.huny_position < 0
                position = -rit.huny_position;
            else
                position = rit.huny_position;
            end
            while position > 5000
                ms = sell(rit, 'HUNY', 5000)        % server order limit is 5000
            end
            ms = sell(rit, 'HUNY', position)    

        elseif rsindex <= 30
            if rsindex == 0 && rit.huny_position > -2000 
                ms = sell(rit, 'HUNY', 1000)     
            elseif rsindex_pre > 30
                ls = limitOrder(rit, 'HUNY', -1000, rit.huny_bid + 0.01)
            else
                ls = limitOrder(rit, 'HUNY', -100, rit.huny_bid + 0.01)
            end
            
        elseif rsindex > 30 && rsindex_pre < 30
            if rit.huny_position < 0
                position = -rit.huny_position;
            else
                position = rit.huny_position;
            end
            
            while position > 5000
                mb = buy(rit, 'HUNY', 5000)        % server order limit is 5000
            end
            mb = buy(rit, 'HUNY', position)       

        end
        
    end
    
	g = gain;
	l = loss;
    2
    
end



