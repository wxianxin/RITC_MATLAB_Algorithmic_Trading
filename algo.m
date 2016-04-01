%Author: Steven	Date: 20150214
rit = rotmanTrader;
rit.updateFreq = 0.1;

subscribe(rit,{'pooh|last';'pooh|ask';'pooh|bid';'tigr|last';'tigr|ask';'tigr|bid';'eyor|last';'eyor|ask';'eyor|bid';'huny|last';'huny|ask';'huny|bid'});
subscribe(rit,{'pooh|position';'tigr|position';'eyor|position';'huny|position'});

ticker = {'POOH';'POOH';'POOH';'POOH';'TIGR';'TIGR';'TIGR';'TIGR';'EYOR';'EYOR';'EYOR';'EYOR';'HUNY';'HUNY';'HUNY';'HUNY'};
action = {'Buy';'Buy';'Sell';'Sell';'Buy';'Buy';'Sell';'Sell';'Buy';'Buy';'Sell';'Sell';'Buy';'Buy';'Sell';'Sell';};


while rit.timeRemaining > 10
    
    id = getOrders(rit);
    if size(id,2)> 6
        rit.cancelOrder(id);
        rit.clearQueuedOrders;
    end
    
    [quantity, price] = prep(rit);
    quantity = quantity.';
    price = price.';


    blotter = table(ticker, action, quantity, price);
    blotterID = blotterOrder(rit,blotter)
    pause(0.1)

end


while rit.timeRemaining > 0

    marketclose(rit)
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

blotter = table('huny', 'sell', -1000, 20);
blotterID = blotterOrder(rit,blotter)

