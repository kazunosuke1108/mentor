A = readmatrix('both_highv02.csv','Range','JS520:JU870');
x_a=A(1:end,1);
y_a=A(1:end,2);
z_a=A(1:end,3);

B = readmatrix('both_highv02.csv','Range','ACE520:ACG870');
x_b=B(1:end,1);
y_b=B(1:end,2);
z_b=B(1:end,3);

x_a1=x_a-x_a(1)
y_a1=y_a-y_a(1)
z_a1=z_a-z_a(1)

x_b1=x_b-x_b(1)
y_b1=y_b-y_b(1)
z_b1=z_b-z_b(1)



plot3(x_a1,y_a1,z_a1,x_b1,y_b1,z_b1);

title('REJC')
xlabel('x')
ylabel('y')
zlabel('z')
legend('hayashide','takahashi')
grid on

hold on

p_a = plot3(x_a1(1),y_a1(1),z_a1(1),'o','MarkerFaceColor','blue');
p_b = plot3(x_b1(1),y_b1(1),z_b1(1),'o','MarkerFaceColor','red');

hold off
axis manual

for k = 2:length(x_a1)
    p_a.XData = x_a1(k);
    p_a.YData = y_a1(k);
    p_a.ZData = z_a1(k);

    p_b.XData = x_b1(k);
    p_b.YData = y_b1(k);
    p_b.ZData = z_b1(k);
    drawnow
end

v = VideoWriter('highv_REJC.mp4','MPEG-4');
open(v);
for k = 1:20 
   
   frame = getframe(gcf);
   writeVideo(v,frame);
end

close(v)

