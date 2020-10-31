#Metropolis Hastings MCMC Algorithm
states = 1:100
Nstates = length(states)
pi = states 

Nsteps = 100000
theta = rep(NA, Nsteps)
theta[1] = round(Nstates / 2, 0) 

for (i in 2:Nsteps){
  current = theta[i - 1]
  proposed = sample(c(current + 1, current - 1), size = 1, prob = c(0.5, 0.5))
  if (!(proposed %in% states)){ #if move outside of specified range
    proposed = current
  }
  p = min(1, pi[proposed] / pi[current])
  theta[i] = sample(c(proposed, current), size = 1, prob = c(p, 1-p))
}

#trace plot

plot(1:Nsteps, theta, type = "o", xlim = c(1, Nsteps),
     ylim = c(1, Nstates), xlab = "Step", ylab = "State")

#frequency plot

plot(table(theta) / Nsteps, xlab = "State", ylab = "Relative Frequency",
     ylim = c(0, max(pi / sum(pi))), xlim = range(theta))
par(new = T)
plot(states, pi / sum(pi), type = 'o', ylim = c(0, max(pi / sum(pi))),
     yaxt = 'n', xaxt = 'n', xlab = "",ylab = "", xlim = range(theta),
     col = "purple")
