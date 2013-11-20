function Br=lroot(fun,xmin,xmax,nx,flag)
if nargin<5, flag=0; end % denying the graphical output
if nargin<4 | isempty(nx), nx=20; end % the default number of brackets
% Creating vectors of potential brackets and corresponding f(x) values
x=linspace(xmin-.1,xmax+.1,nx);
f=fcnchk(fun); f=feval(f,x);
% Searching for the brackets
nb=0; Br=[]; % Br is null unless brackets are found
    for k=1:length(f)-1
        if sign(f(k))*sign(f(k+1))<=0   % true if sign(f(x)) changes
        nb=nb+1;
        Br(nb,1)=x(k); Br(nb,2)=x(k+1); % saving the bracket bounds
        end
    end
% Plotting function f(x) with the brackets
    if flag~=0
% Preparing data to draw boxes that indicate brackets
    ytop=max(f); ybot=min(f);           % y-coordinates of the box
    ybox=0.05*[ybot ytop ytop ybot ybot]; % around a bracket
    c=[0.7 0.6 0.7];                    % RGB color for bracket the boxes
    hold on
        for i=1:nb
        fill([Br(i,1) Br(i,1) Br(i,2) Br(i,2) Br(i,1)],ybox,c); % adding box
        end
    xp=linspace(xmin-.1,xmax+.1);       % vector of arguments for plotting
    fu1=fcnchk(fun); fp=feval(fu1,xp);  % vector of f(x) values brackets
    plot(xp,fp,'Linewidth',2), plot(get(gca,'xlim'),[0 0],'-.k');
    xlabel('x'); ylabel('f(x) with localized roots');
    if nb==0
      text(xmin,0.65*ytop,'No roots found','background','w')
    elseif nb==1
      text(xmin,0.65*ytop,'One root found','background','w')
    else
      text(xmin,0.65*ytop,[num2str(nb) ' roots found'],'background','w')
    end
    grid
    plot([xmin,xmax],zeros(2,1),'r-.')
    hold off
    end
if isempty(Br)                          % warning message
warning ('No brackets found. Check [xmin, xmax] or increase nx');
end