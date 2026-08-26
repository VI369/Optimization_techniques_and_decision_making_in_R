# Vidisha - 22401172024
# =========================================================
# EXPERIMENT 05
# Aim: To solve decision making problems under uncertainty
# using R.
#
# Criteria implemented:
#   - Maximax Criterion
#   - Maximin Criterion
#   - Minimax Regret Criterion
#   - Laplace Criterion
#   - Hurwicz Criterion
# =========================================================

# -------------------------------
# Step 1: Create Payoff Matrix
# -------------------------------
payoff <- matrix(c(5,15,25,
                   10,10,30,
                   -5,20,40),
                 nrow=3, byrow=TRUE)

rownames(payoff) <- c("A1","A2","A3")
colnames(payoff) <- c("Low","Medium","High")

cat("=== Payoff Matrix ===\n")
print(payoff)

# -------------------------------
# Step 2: Maximax
# -------------------------------
maximax <- apply(payoff, 1, max)
cat("\nMaximax:\n"); print(maximax)

best_maximax <- names(which.max(maximax))
cat("Best (Maximax):", best_maximax, "\n")

# -------------------------------
# Step 3: Maximin
# -------------------------------
maximin <- apply(payoff, 1, min)
cat("\nMaximin:\n"); print(maximin)

best_maximin <- names(which.max(maximin))
cat("Best (Maximin):", best_maximin, "\n")

# -------------------------------
# Step 4: Minimax Regret
# -------------------------------
max_col <- apply(payoff, 2, max)
regret <- sweep(payoff, 2, max_col, "-")

cat("\nRegret Matrix:\n"); print(regret)

max_regret <- apply(regret, 1, max)
cat("\nMax Regret:\n"); print(max_regret)

best_minimax <- names(which.min(max_regret))
cat("Best (Minimax Regret):", best_minimax, "\n")

# -------------------------------
# Step 5: Laplace
# -------------------------------
laplace <- rowMeans(payoff)
cat("\nLaplace:\n"); print(laplace)

best_laplace <- names(which.max(laplace))
cat("Best (Laplace):", best_laplace, "\n")

# -------------------------------
# Step 6: Hurwicz
# -------------------------------
alpha <- 0.7

max_p <- apply(payoff, 1, max)
min_p <- apply(payoff, 1, min)

hurwicz <- alpha * max_p + (1 - alpha) * min_p

cat("\nHurwicz:\n"); print(hurwicz)

best_hurwicz <- names(which.max(hurwicz))
cat("Best (Hurwicz):", best_hurwicz, "\n")

# -------------------------------
# Step 7: Final Summary
# -------------------------------
cat("\n=============================\n")
cat("FINAL SUMMARY\n")
cat("=============================\n")

cat("Maximax        :", best_maximax, "\n")
cat("Maximin        :", best_maximin, "\n")
cat("Minimax Regret :", best_minimax, "\n")
cat("Laplace        :", best_laplace, "\n")
cat("Hurwicz        :", best_hurwicz, "\n")
