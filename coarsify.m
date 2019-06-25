% Coarsify by a factor of k
% Pcoarse=coarsify(Pin,k)

function Pcoarse=coarsify(Pin,k)

if ~isvector(Pin)
    warning('Matrix is being treated as a vector');
end

n=numel(Pin);

Pin=reshape(Pin,1,n);

% This one pads edges with zeros
%padding=zeros(1,ceil(n/k)*k-n)+mean(Pin(ceil(n/k)*k-k+1:n));
%Pin=[Pin padding];
%Pcoarse=mean(reshape(Pin,k,ceil(n/k)),1);

% This one chops edges
Pin=Pin(1:(floor(n/k)*k));
Pcoarse=mean(reshape(Pin,k,floor(n/k)),1);

end




