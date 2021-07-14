defmodule Grubbs do
  def sqr x do
    x * x
  end
  def tryer v, z do
    cond do
      v < z ->
        "No"
      v >= z ->
        "Yes"
    end
  end
  def z_crit n, a do
    t_crit = Statistics.Distributions.T.ppf(n - 2).(a / (2 * n))
    num = (n - 1) * t_crit
    den = Statistics.Math.sqrt(n * (n - 2 + sqr(t_crit)))
    abs(num / den)
  end
  def z_score vls, crit do
    mean = Statistics.mean(vls)
    std = Statistics.stdev(vls)
    zis = for v <- vls, do: (abs(mean - v) / std)
    for v <- zis, do: tryer(v, crit)
  end

end
