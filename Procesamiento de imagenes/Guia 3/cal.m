function [wb,wf,mb,mf,vrb,vrf]=cal(i,b,m)
  % weight
  wb=0;
  wf=0;
  mb=0;
  mf=0;
  b=double(b);
  vb=0;vf=0;
  vrb=0;
  vrf=0;
  for s=1:m
      if(b(s,1)<(i))
          wb=wb+1;
          mb=mb+b(s,1);
             else
          wf=wf+1;
          mf=mf+b(s,1);
       end
  end
  %mean
  if(wb==0)
      mb=0;
   mf=mf/wf;
  elseif(wf==0)
  wf=0;
  mb=mb/wb;
  else
  mb=mb/wb;
  mf=mf/wf;
  end
  %weight
  wb=wb/m;
  wf=wf/m;
  %variance
  for t=1:m
      if(b(t,1)<(i))
  vrb=vrb+((b(t,1)-mb)^2);
  vb=vb+1;
      else
  vrf=vrf+((b(t,1)-mf)^2);
  vf=vf+1;
      end
  end
  if(vb==0)
      vrb=0;
      vrf=vrf/vf;
  elseif(vf==0)
      vrf=0;
      vrb=vrb/vb;
  else
  vrb=vrb/vb;
  vrf=vrf/vf;
  end