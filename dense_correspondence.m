function [ pts1, pts2 ] = dense_correspondence( im1, im2, F)

%       im1 - Image 1
%       im2 - Image 2
%       F - Fundamental Matrix between im1 and im2
p1=[];
for i=10:1:470
    for j=10:1:630
        p1=[p1;j i];
    end
end
p2=p1;
for i=1:size(p1,1) 
    [ p2(i,1), p2(i,2) ] = epipolarCorrespondence( I1, I2, F, p1(i,1), p1(i,2) );
end
colrs=zeros(size(p1,1),3);
for i=1:size(p1,1)
    colrs(i,:)=I1(round(p1(i,2)),round(p1(i,1)),:);
end
[ P, error ] = triangulate( M1, p1, M2, p2 );
prefined=[];
colrsrefined=[];
for i=1:size(colrs,1)
    if(colrs(i,1)+colrs(i,2)+colrs(i,3)>50)
        prefined=[prefined;P(i,:)];
        colrsrefined=[colrsrefined;colrs(i,:)];
    end
end
ptCloud = pointCloud(P(:,1:3));
ptCloud.Color=uint8(colrs);
ptCloudrefined = pointCloud(prefined(:,1:3));
ptCloudrefined.Color=uint8(colrsrefined);
pcwrite(ptCloud, 'pointcloud.ply' );
pcshow(ptCloud);%Displays the generated dense point cloud

end

