function seamless = get_mixing_gradients(source, target, mask, seamless, A, ir, ic, N, row_offset, col_offset)

    for color=1:3 % solve for each colorchannel

        % compute b for each color
        b=zeros(N,1);

        for ib=1:N

            i = ir(ib);
            j = ic(ib);

            b(ib) = b(ib) + target(row_offset+i-1,col_offset+j,color)*(1-mask(i-1,j)) + target(row_offset+i+1,col_offset+j,color)*(1-mask(i+1,j)) +  target(row_offset+i,col_offset+j-1,color)*(1-mask(i,j-1)) + target(row_offset+i,col_offset+j+1,color)*(1-mask(i,j+1));

            source_main = source(i,j,color);
            source_1 = source_main - source(i-1,j,color);
            source_2 = source_main - source(i+1,j,color);
            source_3 = source_main - source(i,j-1,color);
            source_4 = source_main - source(i,j+1,color);

            target_main = target(row_offset+i,col_offset+j,color);
            target_1 = target_main - target(row_offset+i-1,col_offset+j,color);
            target_2 = target_main - target(row_offset+i+1,col_offset+j,color);
            target_3 = target_main - target(row_offset+i,col_offset+j-1,color);
            target_4 = target_main - target(row_offset+i,col_offset+j+1,color);

            if abs(source_1) > abs(target_1)
                b(ib) = b(ib) + source_1;
            else
                b(ib) = b(ib) + target_1;
            end

            if abs(source_2) > abs(target_2)
                b(ib) = b(ib) + source_2;
            else
                b(ib) = b(ib) + target_2;
            end

            if abs(source_3) > abs(target_3)
                b(ib) = b(ib) + source_3;
            else
                b(ib) = b(ib) + target_3;
            end

            if abs(source_4) > abs(target_4)
                b(ib) = b(ib) + source_4;
            else
                b(ib) = b(ib) + target_4;
            end

        end

        % solve linear system A*x = b;
        x = A\b;

        % impaint target image
        for ib = 1:N
            seamless(row_offset+ir(ib),col_offset+ic(ib),color) = x(ib);
        end


    end

end
