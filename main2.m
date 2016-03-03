%Author: Steven	Date: 20150216

% cancel order
% scenario recognition

rit = rotmanTrader;
rit.updateFreq = 0.1;
x = 0;
prompt = 'input';

subscribe(rit,{'pooh|last';'pooh|ask';'pooh|bid';'tigr|last';'tigr|ask';'tigr|bid';'eyor|last';'eyor|ask';'eyor|bid';'huny|last';'huny|ask';'huny|bid'});
subscribe(rit,{'pooh|position';'tigr|position';'eyor|position';'huny|position'});
subscribe(rit,{'huny|last';'huny|position';'huny|bid';'huny|ask'});

ticker = {'POOH';'POOH';'POOH';'POOH';'TIGR';'TIGR';'TIGR';'TIGR';'EYOR';'EYOR';'EYOR';'EYOR'};
action = {'Buy';'Buy';'Sell';'Sell';'Buy';'Buy';'Sell';'Sell';'Buy';'Buy';'Sell';'Sell'};


% preparation for huny RSI strategy
g = zeros(1,14);
l = zeros(1,14);
p = 80;

while rit.timeRemaining == 300
    disp('Waiting...')
    pause(0.2)
end

%%%    

while rit.timeRemaining > 10 && rit.timeRemaining < 300
    if rit.timeRemaining > 50 && rit.timeRemaining < 55
        x = input(prompt)
    end
    
    if rit.timeRemaining > 100 && rit.timeRemaining < 105
        x = input(prompt)
    end
    
    if rit.timeRemaining > 150 && rit.timeRemaining < 155
        x = input(prompt)
    end
    
    if rit.timeRemaining > 200 && rit.timeRemaining < 205
        x = input(prompt)
    end
    
    if rit.timeRemaining > 250 && rit.timeRemaining < 255
        x = input(prompt)
    end
    
    if x == 0
        k = 0;
        while k < 8

            id = getOrders(rit);

            if size(id,2)> 6
                rit.cancelOrder(id);
                rit.clearQueuedOrders;
            end

            [quantity, price] = prep(rit);
            quantity = quantity.';
            price = price.';

            blotter = table(ticker, action, quantity, price);
            blotterID = blotterOrder(rit,blotter);
            %disp('Markter Making...')
            pause(0.3)

            k = k + 1;

        end
        [g, l, p] = rsi(rit, g, l, p);
        
    else
        action = {'Sell';'Sell';'Buy';'Buy';'Sell';'Sell';'Buy';'Buy';'Sell';'Sell';'Buy';'Buy'};
        k = 0;
        while k < 8

            id = getOrders(rit);

            if size(id,2)> 6
                rit.cancelOrder(id);
                rit.clearQueuedOrders;
            end

            [quantity, price] = prep(rit);
            quantity = quantity.';
            price = price.';
            newprice(1) = price(4);
            newprice(2) = price(3);
            newprice(3) = price(2);
            newprice(4) = price(1);
            newprice(5) = price(8);
            newprice(6) = price(7);
            newprice(7) = price(6);
            newprice(8) = price(5);
            newprice(9) = price(12);
            newprice(10) = price(11);
            newprice(11) = price(10);
            newprice(12) = price(9);
                      
            blotter = table(ticker, action, quantity, price);
            blotterID = blotterOrder(rit,blotter);
            %disp('Markter Making...')
            pause(0.3)

            k = k + 1;

        end
        [g, l, p] = rsi(rit, g, l, p);
    end
    
end
%%%

while rit.timeRemaining > 0

    close(rit)
    pause(0.3)
    
end




%{
ticker = {'POOH';'TIGR';'EYOR';'HUNY'};
price = [0;0;0;0];



while rit.timeRemaining > 0
    
    disp('closing!')
    [quantity, action] = close(rit);
    quantity = quantity.';
    blotter = table(ticker, action, quantity, price);
    blotterID = blotterOrder(rit,blotter)
    pause(0.3)

end
%}