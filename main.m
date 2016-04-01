%Author: Steven	Date: 20150216

% cancel order
% scenario recognition

rit = rotmanTrader;
rit.updateFreq = 0.1;
x = 0;

subscribe(rit,{'pooh|last';'pooh|ask';'pooh|bid';'tigr|last';'tigr|ask';'tigr|bid';'eyor|last';'eyor|ask';'eyor|bid';'huny|last';'huny|ask';'huny|bid'});
subscribe(rit,{'pooh|position';'tigr|position';'eyor|position';'huny|position'});
subscribe(rit,{'huny|last';'huny|position';'huny|bid';'huny|ask'});

ticker = {'POOH';'POOH';'POOH';'POOH';'TIGR';'TIGR';'TIGR';'TIGR';'EYOR';'EYOR';'EYOR';'EYOR'};
ticker = {'POOH';'POOH';'POOH';'POOH';'TIGR';'TIGR';'TIGR';'TIGR';'EYOR';'EYOR';'EYOR';'EYOR'};
action = {'Buy';'Buy';'Sell';'Sell';'Buy';'Buy';'Sell';'Sell';'Buy';'Buy';'Sell';'Sell'};
flipaction = {'Sell';'Sell';'Buy';'Buy';'Sell';'Sell';'Buy';'Buy';'Sell';'Sell';'Buy';'Buy'};

% preparation for huny RSI strategy
g = zeros(1,14);
l = zeros(1,14);
p = 80;

while rit.timeRemaining == 300
    disp('Waiting...')
    pause(0.2)
end
    

while rit.timeRemaining > 10 && rit.timeRemaining < 300 

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
        pause(0.1)
        
        k = k + 1;
        
    end
    
    %[g, l, p] = rsi(rit, g, l, p);
    
end

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