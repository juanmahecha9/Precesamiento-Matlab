function [out] = binero(im,se,imx_or)

if (isa(im,'uint32'))%-------------- UINT32-----
    if (~isa(se,'strel'))
        se=strel(se);
    end
    imx0=imx_or;
    seq=getsequence(se);
    lunghezza=size(seq,1);
    out=bero4(im,getnhood(seq(1)),2,imx0);
    for ii=2:lunghezza
        out=bero4(out,getnhood(seq(ii)),2,imx0);        
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
            out=bero4(im,getnhood(seq(1))',uscita,imy);
            out=out(:,1:imx); 
            out=out';            
        else
            out=bero4(im,getnhood(seq(1))',2,imy);
            for ii=2:(lunghezza-1)
                out=bero4(out,getnhood(seq(ii))',2,imy);        
            end
            out=bero4(out,getnhood(seq(lunghezza))',uscita,imy);
            out=out(1:imy,1:imx); 
            out=out';            
        end
    else
        seq=getsequence(se);
        lunghezza=size(seq,1);
        if (lunghezza==1)
            out=bero4(im,getnhood(seq(1)),uscita,imx);            
        else
            out=bero4(im,getnhood(seq(1)),2,imx);
            for ii=2:(lunghezza-1)
                out=bero4(out,getnhood(seq(ii)),2,imx);        
            end
            out=bero4(out,getnhood(seq(lunghezza)),uscita,imx);
            out=out(1:imx,:);
        end
    end
end
%-----------------------------------------------