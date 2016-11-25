function [ x2, y2 ] = epipolarCorrespondence( im1, im2, F, x1, y1 )
% epipolarCorrespondence:
%       im1 - Image 1
%       im2 - Image 2
%       F - Fundamental Matrix between im1 and im2
%       x1 - x coord in image 1
%       y1 - y coord in image 1

% Q2.6 - Todo:
%           Implement a method to compute (x2,y2) given (x1,y1)
%           Use F to only scan along the epipolar line
%           Experiment with different window sizes or weighting schemes
%           Save F, pts1, and pts2 used to generate view to q2_6.mat
%
%           Explain your methods and optimization in your writeup

%syms x y
%a=[x y 1];
b=[x1;y1;1];
c=b'*F;
%c2=c(1)*x + c(2)*y + c(3);
%yval(x)=solve(c2,y);
minerror=10^20;
bestmatch=[0 0];
[rows,cols]=size(im2);
range=20;%search space
start=max(4,y1-range);
endi=min(rows-3,y1+range);
for i=start:endi
    j=round((-c(2)*i-c(3))/c(1));
    if(j>3)
        if(j<cols-3)
            %[j i]
            mat1=im1(y1-3:y1+3,x1-3:x1+3);
            mat2=im2(i-3:i+3,j-3:j+3);
            diff=abs(mat1-mat2);
            diff=diff(:);
            diff(13)=2*diff(13);%Weighing more
            dist=(y1-i)^2+(x1-j)^2;%Penalizing the distance
            error=sum(diff)+dist;
            if(error<minerror)
                minerror=error;
                bestmatch=[i j];
            end
        end
    end
end
x2=bestmatch(2);
y2=bestmatch(1);
            
            
    
    

end

