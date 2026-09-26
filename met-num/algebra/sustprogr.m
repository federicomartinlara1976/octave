function x = sustprogr(T,c)
% Esta función resuelve un SEL Tx = c, con T triangular inferior
% y regular, mediante sustituciones progresivas.
	[dim,nc] = size(c);
	x = zeros(dim,nc);

	for i = 1:dim
		x(i,:) = (c(i,:)-T(i,:)*x)/T(i,i);
	endfor

endfunction

