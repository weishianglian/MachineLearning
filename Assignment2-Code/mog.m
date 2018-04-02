% Simple script to do EM for a mixture of Gaussians.
% -------------------------------------------------
%  based on code from  Rasmussen and Ghahramani
% (http://www.gatsby.ucl.ac.uk/~zoubin/course02/)

% Initialise parameters
load('PB_data.mat');

% phoneme 1
ph1F1 = f1(phno==1);
ph1F2 = f2(phno==1);
x = [ph1F1, ph1F2];

% phoneme 2
% ph2F1 = f1(phno==2);
% ph2F2 = f2(phno==2);
% x = [ph2F1, ph2F2];

[n D] = size(x);                    % number of observations (n) and dimension (D)
k = 3;                              % number of components
p = ones(1,k)/k;                    % mixing proportions
mu = x(ceil(n.*rand(1,k)),:)';      % means picked rqandomly from data
s2 = zeros(D,D,k);                  % covariance matrices
niter=100;                          % number of iterations

% initialize covariances 

for i=1:k
  s2(:,:,i) = cov(x)./k;      % initially set to fraction of data covariance
end

set(gcf,'Renderer','zbuffer');

clear Z;
try

  % run EM for niter iterations
  
  for t=1:niter,
    fprintf('t=%d\r',t);
    % Do the E-step:
  
    for i=1:k
      Z(:,i) = p(i)*det(s2(:,:,i))^(-0.5)*exp(-0.5*sum((x'-repmat(mu(:,i),1,n))'*inv(s2(:,:,i)).*(x'-repmat(mu(:,i),1,n))',2));
    end
    Z = Z./repmat(sum(Z,2),1,k);
    
    % Do the M-step:
    
    for i=1:k
      mu(:,i) = (x'*Z(:,i))./sum(Z(:,i));
      
      % We will fit Gaussians with diagonal covariances:
      
      s2(:,:,i) = diag((x'-repmat(mu(:,i),1,n)).^2*Z(:,i)./sum(Z(:,i))); 
      
      % To fit general Gaussians use the line:
      % s2(:,:,i) =
      % (x'-repmat(mu(:,i),1,n))*(repmat(Z(:,i),1,D).*(x'-repmat(mu(:,i),1,n))')./sum(Z(:,i));
      
      p(i) = mean(Z(:,i));
    end
    
    clf
    hold on
    plot(x(:,1),x(:,2),'.');
    for i=1:k
      plot_gaussian(2*s2(:,:,i),mu(:,i),i,11);
    end
    drawnow;
  end
  
  
  
catch
  disp('Numerical Error in Loop - Possibly Singular Matrix');
end
