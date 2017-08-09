%% PLOT P(e)

load('object_event_bn_short256.mat');
load('event_name.mat');
count_p = count/sum(count);
bar(count_p);
axis([0 100 0 0.07])
set(gca,'xtick',[1:1:100]);
set(gca,'XTickLabel',event_name,'Fontname', 'Times New Roman','FontWeight','Bold');
xticklabel_rotate([],90,[]);

 %hh = rotateXLabels(gca,90);

%% PLOT P(O)
clear 
load('P_object_and_scene.mat');
load('object_name_short.mat');
[v ind] = sort(P_object,'descend');
set(gcf,'DefaultTextInterpreter','none')
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'points');
set(gcf, 'PaperSize', [220 580]);
set(gcf, 'PaperPosition', [0 0 560 200]);
bar(P_object(ind(1:100)));
axis([0 101 0 0.03])
set(gca,'xtick',[1:1:100],'Fontname', 'Times New Roman');
set(gca,'XTickLabel',object_name_short(ind(1:100)),'Fontname', 'Times New Roman');
hText = xticklabel_rotate([],90,[]);

%xlabel('Object Category', 'Fontname', 'Times New Roman','FontWeight','Bold','linewidth',5)
%ylabel('Object Distribution', 'Fontname', 'Times New Roman','FontWeight','Bold')

%set(gca,'FontWeight','Bold');
%set(gca,'XTickLabel',object_name_short(1:100));

%% PLOT P(S)
clear 
load('P_object_and_scene.mat');
load('scene_name.mat');
% for i=5:205
%     strrep(scene_name{i},'_','\_');
% end
[v ind] = sort(P_scene,'descend');
set(gcf,'DefaultTextInterpreter','none')
% set(gcf,'unit','normalized','position',[0.2,0.2,0.64,0.32]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'points');
%get(gcf, 'PaperSize')
set(gcf, 'PaperSize', [220 580]);
set(gcf, 'PaperPosition', [0 0 560 200]);
%axis normal;
bar(P_scene(ind(1:100)));
axis([0 101 0 0.07])
%set(gca,'XTickLabel',scene_name(1:100));
set(gca,'xtick',[1:1:100],'Fontname', 'Times New Roman');
set(gca,'XTickLabel',scene_name(ind(1:100)),'Fontname', 'Times New Roman','Fontsize',10);
hText = xticklabel_rotate([],90,[]);


%% PLOT P(e|o) 
clear 
load('P_e_o_99.mat');
load('object_name_short.mat');
load('event_name.mat');
load('index4.mat');
%[hImage, hText, hTick] = heatmap(matrix, xlabels, ylabels, textmatrix, 'param', value, ...)
%heatmap(P_e_o, labels, labels, 1,'Colormap','red','ShowAllTicks',1,'UseLogColorMap',true,'Colorbar',true);
%[hImage, hText, hXText] = heatmap(ActionObject_map(:,sort_obj_ids)'.^0.5, class_names, sort_obj_cls, ...
%    [], 'Colormap', 'red', 'TickAngle', 90,'ShowAllTicks', 1, 'Colorbar', 1);
event_name_99 = {event_name{1:67},event_name{69:100}};
%event_name_99 = {event_name{1:10}};
%figure,
[hImage, hText, hXText] = heatmap(P_e_o(index(1:30),:), event_name_99, {object_name_short{index(1:30)}},...
    [], 'Colormap', 'jet', 'TickAngle', 90,'ShowAllTicks', 1, 'Colorbar', 1);
grid on;
%set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
%% PLOT P(e|s)
clear 
load('P_e_o_99_scene.mat');
load('scene_name_modify.mat');
load('event_name.mat');
load('index_scene_4.mat');
%[hImage, hText, hTick] = heatmap(matrix, xlabels, ylabels, textmatrix, 'param', value, ...)
%heatmap(P_e_o, labels, labels, 1,'Colormap','red','ShowAllTicks',1,'UseLogColorMap',true,'Colorbar',true);
%[hImage, hText, hXText] = heatmap(ActionObject_map(:,sort_obj_ids)'.^0.5, class_names, sort_obj_cls, ...
%    [], 'Colormap', 'red', 'TickAngle', 90,'ShowAllTicks', 1, 'Colorbar', 1);
event_name_99 = {event_name{1:67},event_name{69:100}};
%event_name_99 = {event_name{1:10}};
[hImage, hText, hXText] = heatmap(P_e_o(index(1:30),:), event_name_99, {scene_name{index(1:30)}},...
    [], 'Colormap', 'jet', 'TickAngle', 90,'ShowAllTicks', 1, 'Colorbar', 1);
grid on;

