-- Active: 1722953182097@@127.0.0.1@5432@pbdi@public


-- 1.1 Resolva cada exercício a seguir usando LOOP, WHILE, FOR e FOREACH. Quando o
-- enunciado disser que é preciso “ler” algum valor, gere-o aleatoriamente.


-- https://www.beecrowd.com.br/judge/pt/problems/view/1059
-- Números Pares
-- Faça um programa que mostre os números pares entre 1 e 100, inclusive.

-- versão loop
do $$
declare
  i int := 1;
begin
  loop
    if i % 2 = 0 then
      raise notice '%', i;
    end if;

    i := i + 1;
    exit when i > 100;
  end loop;
end;
$$;

-- versão while
do $$
declare
  i int := 1;
begin
  while i <= 100 loop
    if i % 2 = 0 then
      raise notice '%', i;
    end if;

    i := i + 1;
  end loop;
end;
$$;

-- versão for
do $$
begin
  for i in 2..100 by 2 loop
    raise notice '%', i;
  end loop;
end;
$$;

-- versão foreach
do $$
declare
  vetor int[] := array[2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 100];
  i int;
begin
  foreach i in array vetor loop
    raise notice '%', i;
  end loop;
end;
$$;



-- https://www.beecrowd.com.br/judge/pt/problems/view/1060
-- Números Positivos
-- Faça um programa que leia 6 valores. Estes valores serão somente negativos ou positivos 
-- (desconsidere os valores nulos). A seguir, mostre a quantidade de valores positivos digitados.

-- versão loop
do $$
declare
  i int := 1;
  valor int;
  total_positivo int := 0;
begin
  loop
    valor := valor_aleatorio_entre(-50, 50);
    raise notice '%', valor;
    if valor > 0 then
      total_positivo := total_positivo + 1;
    end if;

    i := i + 1;
    exit when i > 6;
  end loop;

  raise notice '% valores positivos', total_positivo;
end;
$$;

-- versão while
do $$
declare
  i int := 1;
  valor int;
  total_positivo int := 0;
begin
  while i <= 6 loop
    valor := valor_aleatorio_entre(-50, 50);
    raise notice '%', valor;
    if valor > 0 then
      total_positivo := total_positivo + 1;
    end if;

    i := i + 1;
  end loop;

  raise notice '% valores positivos', total_positivo;
end;
$$;

-- versão for
do $$
declare
  valor int;
  total_positivo int := 0;
begin
  for i in 1..6 loop
    valor := valor_aleatorio_entre(-50, 50);
    raise notice '%', valor;
    if valor > 0 then
      total_positivo := total_positivo + 1;
    end if;
  end loop;

  raise notice '% valores positivos', total_positivo;
end;
$$;

-- versão foreach
do $$
declare
  vetor int[] := array[1, 2, 3, 4, 5, 6];
  i int;
  valor int;
  total_positivo int := 0;
begin
  foreach i in array vetor loop
    valor := valor_aleatorio_entre(-50, 50);
    raise notice '%', valor;
    if valor > 0 then
      total_positivo := total_positivo + 1;
    end if;
  end loop;

  raise notice '% valores positivos', total_positivo;
end;
$$;



-- https://www.beecrowd.com.br/judge/pt/problems/view/1071
-- Soma de Impares Consecutivos I
-- Leia 2 valores inteiros X e Y. A seguir, calcule e mostre a soma dos números impares entre eles.

-- versão loop
do $$
declare
  x int := valor_aleatorio_entre(20, 50);
  y int := valor_aleatorio_entre(20, 50);
  swap int;
  soma int := 0;
begin
  raise notice 'x: %, y: %', x, y;

  if x > y then
    swap := x;
    x := y;
    y := swap;
  end if;

  x := x + 1; -- considerando somente os valores entre x e y
  loop
    exit when x >= y;

    if x % 2 <> 0 then
      soma := soma + x;
    end if;

    x := x + 1;
  end loop;

  raise notice '%', soma;
end;
$$;

-- versão while
do $$
declare
  x int := valor_aleatorio_entre(20, 50);
  y int := valor_aleatorio_entre(20, 50);
  swap int;
  soma int := 0;
begin
  raise notice 'x: %, y: %', x, y;

  if x > y then
    swap := x;
    x := y;
    y := swap;
  end if;

  x := x + 1; -- considerando somente os valores entre x e y
  while x < y loop
    if x % 2 <> 0 then
      soma := soma + x;
    end if;

    x := x + 1;
  end loop;

  raise notice '%', soma;
end;
$$;

-- versão for
do $$
declare
  x int := valor_aleatorio_entre(20, 50);
  y int := valor_aleatorio_entre(20, 50);
  swap int;
  soma int := 0;
begin
  raise notice 'x: %, y: %', x, y;

  if x > y then
    swap := x;
    x := y;
    y := swap;
  end if;

  -- considerando somente os valores entre x e y
  x := x + 1;
  y := y - 1;
  for i in x..y loop
    if i % 2 <> 0 then
      soma := soma + i;
    end if;
  end loop;

  raise notice '%', soma;
end;
$$;

-- versão foreach
do $$
declare
  x int := valor_aleatorio_entre(20, 50);
  y int := valor_aleatorio_entre(20, 50);
  swap int;
  soma int := 0;
  vetor int[];
  i int;
begin
  raise notice 'x: %, y: %', x, y;

  if x > y then
    swap := x;
    x := y;
    y := swap;
  end if;

  -- considerando somente os valores entre x e y
  x := x + 1;
  y := y - 1;
  for i in x..y loop
    vetor := vetor || i;
  end loop;
  
  if x < y then -- mitigar vetor nulo
    foreach i in array vetor loop
      if i % 2 <> 0 then
        soma := soma + i;
      end if;
    end loop;
  end if;

  raise notice '%', soma;
end;
$$;



-- https://www.beecrowd.com.br/judge/pt/problems/view/1101
-- Sequência de Números e Soma
-- Leia um conjunto não determinado de pares de valores M e N (parar quando algum dos valores 
-- for menor ou igual a zero). Para cada par lido, mostre a sequência do menor até o maior e 
-- a soma dos inteiros consecutivos entre eles (incluindo o N e M).

-- versão loop
do $$
declare
  m int;
  n int;
  swap int;
  saida text;
  soma int;
begin
  <<externo>>
  loop
    -- (parar quando algum dos valores for menor ou igual a zero)
    m := valor_aleatorio_entre(-5, 100);
    n := valor_aleatorio_entre(-5, 100);
    raise notice '% %', m, n;
    exit externo when m <= 0 or n <= 0;

    if m > n then
      swap := m;
      m := n;
      n := swap;
    end if;

    saida := '';
    soma := 0;
    <<interno>>
    loop
      saida := saida || m;
      saida := saida || ' ';
      soma := soma + m;
      m := m + 1;

      exit interno when m > n;
    end loop;

    saida := saida || 'Sum=';
    saida := saida || soma;
    raise notice '%', saida;
  end loop;
end;
$$;

-- versão while
do $$
declare
  -- (parar quando algum dos valores for menor ou igual a zero)
  m int := valor_aleatorio_entre(-5, 100);
  n int := valor_aleatorio_entre(-5, 100);
  swap int;
  saida text;
  soma int;
begin
  raise notice '% %', m, n;

  while m > 0 and n > 0 loop
    if m > n then
      swap := m;
      m := n;
      n := swap;
    end if;

    saida := '';
    soma := 0;
    while m <= n loop
      saida := saida || m;
      saida := saida || ' ';
      soma := soma + m;
      m := m + 1;
    end loop;

    saida := saida || 'Sum=';
    saida := saida || soma;
    raise notice '%', saida;
    
    m := valor_aleatorio_entre(-5, 100);
    n := valor_aleatorio_entre(-5, 100);
    raise notice '% %', m, n;
  end loop;
end;
$$;

-- versão for
do $$
declare
  m int;
  n int;
  swap int;
  saida text;
  soma int;
begin
  loop
    -- (parar quando algum dos valores for menor ou igual a zero)
    m := valor_aleatorio_entre(-5, 100);
    n := valor_aleatorio_entre(-5, 100);
    raise notice '% %', m, n;
    exit when m <= 0 or n <= 0;

    if m > n then
      swap := m;
      m := n;
      n := swap;
    end if;

    saida := '';
    soma := 0;

    for i in m..n loop
      saida := saida || i;
      saida := saida || ' ';
      soma := soma + i;
    end loop;

    saida := saida || 'Sum=';
    saida := saida || soma;
    raise notice '%', saida;
  end loop;
end;
$$;

-- versão foreach
do $$
declare
  m int;
  n int;
  swap int;
  saida text;
  soma int;
  vazio int[];
  vetor int[];
  i int;
begin
  loop
    -- (parar quando algum dos valores for menor ou igual a zero)
    m := valor_aleatorio_entre(-5, 100);
    n := valor_aleatorio_entre(-5, 100);
    raise notice '% %', m, n;
    exit when m <= 0 or n <= 0;

    if m > n then
      swap := m;
      m := n;
      n := swap;
    end if;

    saida := '';
    soma := 0;
    vetor := vazio;

    for i in m..n loop
      vetor := vetor || i;
    end loop;

    foreach i in array vetor loop
      saida := saida || i;
      saida := saida || ' ';
      soma := soma + i;
    end loop;

    saida := saida || 'Sum=';
    saida := saida || soma;
    raise notice '%', saida;
  end loop;
end;
$$;





