function [VCK,Hist]=LBP(name)

   
    Im=double(imread(name)); 
    [f,c] = size(Im);
    Pesos=[1 2 4 ; 128 1 8 ; 64 32 16];
    U=zeros(3,3);

    A=0;
    B=0;
    C=0;
    D=0;
    E=0;
    F=0;
    G=0;
    H=0;
    I=0;

        for i=2:1:c-1
            for j=2:1:f-1

                if Im(i-1,j-1) < Im(i,j)
                   U(1,1)=0;
                else if Im(i-1,j-1) >= Im(i,j)
                        U(1,1)=1;
                    end
                end

                if Im(i-1,j) < Im(i,j)
                   U(1,2)=0;
                else if Im(i-1,j) >= Im(i,j)
                        U(1,2)=1;
                    end
                end

                 if Im(i-1,j+1) < Im(i,j)
                    U(1,3)=0;
                 else if Im(i-1,j+1) >= Im(i,j)
                         U(1,3)=1;
                     end
                end

                 if Im(i,j-1) >= Im(i,j)
                   U(2,1)=1;
                 else if Im(i,j-1) < Im(i,j)
                         U(2,1)=0;
                     end
                end

                if Im(i,j) == Im(i,j)
                   U(2,2)=0;
                end

                if Im(i,j+1) < Im(i,j)
                   U(2,3)=0;
                else if Im(i,j+1) >= Im(i,j)
                        U(2,3)=1;
                    end
                end  

                  if Im(i+1,j-1) < Im(i,j)
                   U(3,1)=0;
                  else if Im(i+1,j-1) >= Im(i,j)
                          U(3,1)=1;
                      end
                  end

                if Im(i+1,j) < Im(i,j)
                   U(3,2)=0;
                else if Im(i+1,j) >= Im(i,j)
                        U(3,2)=1;
                    end
                end

                if Im(i+1,j+1) < Im(i,j)
                   U(3,3)=0;
                else if Im(i+1,j+1) >= Im(i,j)
                        U(3,3)=1;
                    end
                end 

                V=U.*Pesos;

                for x=1:1:3
                    for y=1:1:3

                        Num=V(x,y);

                        if Num==0
                           A=A+1;
                        else if Num==1
                                B=B+1;
                            else if Num==2
                                    C=C+1;
                                else if Num==4
                                        D=D+1;
                                    else if Num==8
                                            E=E+1;
                                        else if Num==16
                                                F=F+1;
                                            else if Num==32
                                                    G=G+1;
                                                else if Num==64
                                                        H=H+1;
                                                    else if Num==128
                                                            I=I+1;
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
                end




                S=sum(sum(V));

                VCK(i-1,j-1)=S;

            end
        end

    Hist=[B,C,D,E,F,G,H,I];


end
