function datos_barajados = barajar(datos)

[f,c]=size(datos);
V_rand = rand(f,1);
[B, index]=sort(V_rand);
datos_barajados=datos(index,:);

end



