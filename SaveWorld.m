function SaveWorld(FileName,level,team)
% saves the world to file

fid=fopen(FileName,'wt');

for xi=1:64
    for yi=1:64
        for zi=1:64
            fprintf(fid,'%d,%d\n',level(xi,65-yi,zi),team(xi,65-yi,zi));
        end
    end
end

fclose(fid);

