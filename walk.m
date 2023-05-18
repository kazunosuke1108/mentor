A1=A(208:402,252:254);
x_a=A1(1:end,1);
y_a=A1(1:end,2);
z_a=A1(1:end,3);
B=readmatrix("both_walk.csv");
B1=B(208:402,1098:1100);
x_b=B1(1:end,1);
y_b=B1(1:end,2);
z_b=B1(1:end,3);
x_a1=x_a-x_a(1);
y_a1=y_a-y_a(1);
z_a1=z_a-z_a(1);
x_b1=x_b-x_b(1);
y_b1=y_b-y_b(1);
z_b1=z_b-z_b(1);
fig=figure(); clf;
plot3(x_a1,y_a1,z_a1,x_b1,y_b1,z_b1);
title('Walk RAJC')
xlabel('x')
ylabel('y')
zlabel('z')
legend('hayashide','takahashi')
grid on
p_a = plot3(x_a1(1),y_a1(1),z_a1(1),'o','MarkerFaceColor','blue');
p_b = plot3(x_b1(1),y_b1(1),z_b1(1),'o','MarkerFaceColor','red');
hold off
axis manual
v = VideoWriter('walk_RAJC.mp4','MPEG-4');
open(v);
frames(length(A1)) = struct('cdata',[],'colormap',[]);
frames(1)=getframe(fig);
for k = 2:length(A1)
    
    p_a.XData = x_a1(k);
    p_a.YData = y_a1(k);
    p_a.ZData = z_a1(k);
    p_b.XData = x_b1(k);
    p_b.YData = y_b1(k);
    p_b.ZData = z_b1(k);
    drawnow
    frames(k)=getframe(fig);
end
writeVideo(v,frames);
close(v);