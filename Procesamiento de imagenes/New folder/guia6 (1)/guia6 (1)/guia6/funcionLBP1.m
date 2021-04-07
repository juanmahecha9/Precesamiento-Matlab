function [LBP,VCK]=funcionLBP1(I) 
    [f,c] = size(I);
    Pesos=[1 2 4 ; 128 1 8 ; 64 32 16];
    I1=zeros(3,3);
    n=0;p=0;q=0;r=0;s=0;t=0;u=0;v=0;
    for i=2:1:f-1
        for j=2:1:c-1
     
        if I(i-1,j-1)>=I(i,j)
            I1(1,1)=1;
        else 
            I1(1,1)=0;
        end
        if I(i-1,j)>=I(i,j)
            I1(1,2)=1; 
        else 
            I1(1,2)=0;
        end
     
        if I(i-1,j+1)>=I(i,j)
            I1(1,3)=1; 
        else 
            I1(1,3)=0;
        end
     
        if I(i,j-1)>=I(i,j)
            I1(2,1)=1; 
        else 
            I1(2,1)=0;
        end
     
        if I(i,j)==I(i,j)
            I1(2,2)=0; 
        end
     
        if I(i,j+1)>=I(i,j)
            I1(2,3)=1; 
        else 
            I1(2,3)=0;
        end
     
        if I(i+1,j-1)>=I(i,j)
            I1(3,1)=1; 
        else 
            I1(3,1)=0;
        end
     
        if I(i+1,j)>=I(i,j)
            I1(3,2)=1; 
        else 
            I1(3,2)=0;
        end
     
        if I(i+1,j+1)>=I(i,j)
            I1(3,3)=1; 
        else 
            I1(3,3)=0;
        end

                V=I1.*Pesos;

                for x=1:1:3
                    for y=1:1:3

                        var=V(x,y);

                        if var==1
                           n=n+1;
                        else if var==2
                                p=p+1;
                            else if var==4
                                    q=q+1;
                                else if var==8
                                        r=r+1;
                                    else if var==16
                                            s=s+1;
                                        else if var==32
                                                t=t+1;
                                            else if var==64
                                                    u=u+1;
                                                else if var==128
                                                        v=v+1;
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end

                    end
                end
                Sum=sum(sum(V));
                LBP(i-1,j-1)=Sum;
        end
    end

    VCK=[n,p,q,r,s,t,u,v];
end
