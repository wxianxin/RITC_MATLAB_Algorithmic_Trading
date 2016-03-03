%Author: Steven	Date: 20150216
function [q, p] = prep(rit)
   
    if rit.pooh_position > 5000
        q(1) = 0;
        q(2) = 0;
        q(3) = 600;   
        q(4) = 1000;        
           
    elseif rit.pooh_position > -5000 && rit.pooh_position < 5000
        
        q(1) = 1000;
        q(2) = 600;
        q(3) = 600;   
        q(4) = 1000;      
       
    else
        q(1) = 1000;
        q(2) = 600;
        q(3) = 0;   
        q(4) = 0;              
            
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if rit.tigr_position > 5000
        q(5) = 0;
        q(6) = 0;
        q(7) = 600;   
        q(8) = 1000;        
           
    elseif rit.tigr_position > -5000 && rit.tigr_position < 5000
        
        q(5) = 1000;
        q(6) = 600;
        q(7) = 600;   
        q(8) = 1000;      
       
    else
        q(5) = 1000;
        q(6) = 600;
        q(7) = 0;   
        q(8) = 0;              
            
    end  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if rit.eyor_position > 5000
        q(9) = 0;
        q(10) = 0;
        q(11) = 600;   
        q(12) = 1000;        
           
    elseif rit.eyor_position > -5000 && rit.eyor_position < 5000
        
        q(9) = 1000;
        q(10) = 600;
        q(11) = 600;   
        q(12) = 1000;      
       
    else
        q(9) = 1000;
        q(10) = 600;
        q(11) = 0;   
        q(12) = 0;              
            
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    p(1) = rit.pooh_bid + 0.02;
    p(2) = rit.pooh_bid + 0.01;
    p(3) = rit.pooh_ask - 0.01;
    p(4) = rit.pooh_ask - 0.02;
    
    p(5) = rit.tigr_bid + 0.02;
    p(6) = rit.tigr_bid + 0.01;
    p(7) = rit.tigr_ask - 0.01;
    p(8) = rit.tigr_ask - 0.02;

    p(9) = rit.eyor_bid + 0.02;
    p(10) = rit.eyor_bid + 0.01;
    p(11) = rit.eyor_ask - 0.01;
    p(12) = rit.eyor_ask - 0.02;
       
end


