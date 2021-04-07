function [out] = bindil(im,se)

if (isa(im,'uint32'))%-------------- UINT32-----
    if (~isa(se,'strel'))
        se=strel(se);
    end
    seq=getsequence(se);
    lunghezza=size(seq,1);
    out=bdil6(im,getnhood(seq(1)),2);
    for ii=2:lunghezza
        out=bdil6(out,getnhood(seq(ii)),2);        
    end
else%-------------------------------------------
    if (~isa(se,'strel'))
        se=strel(se);
    end
    if (isa(im,'uint8'))
        uscita=1;
    end
    if (isa(im,'logical'))
        uscita=0;
    end    
    im_dim=size(im);
    imx=im_dim(1);
    imy=im_dim(2);
    if (imx<imy)
        im=im';
        seq=getsequence(se);
        lunghezza=size(seq,1);
        if (lunghezza==1)
            out=bdil6(im,getnhood(seq(1))',uscita);
            out=out(:,1:imx); 
            out=out';            
        else
            out=bdil6(im,getnhood(seq(1))',2);
            for ii=2:(lunghezza-1)
                out=bdil6(out,getnhood(seq(ii))',2);        
            end
            out=bdil6(out,getnhood(seq(lunghezza))',uscita);
            out=out(1:imy,1:imx); 
            out=out';            
        end
    else
        seq=getsequence(se);
        lunghezza=size(seq,1);
        if (lunghezza==1)
            out=bdil6(im,getnhood(seq(1)),uscita);            
        else
            out=bdil6(im,getnhood(seq(1)),2);
            for ii=2:(lunghezza-1)
                out=bdil6(out,getnhood(seq(ii)),2);        
            end
            out=bdil6(out,getnhood(seq(lunghezza)),uscita);
            out=out(1:imx,:);
        end
    end
end
%-----------------------------------------------