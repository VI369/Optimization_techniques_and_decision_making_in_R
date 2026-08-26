# Vidisha - 22401172024
# =========================================================
# EXPERIMENT 06
# Aim: To solve group decision making problems using
# aggregation and weighted aggregation methods in R.
# =========================================================

# ---------------------------------------------------------
# PRACTICE QUESTION 1
# ---------------------------------------------------------
cat("===== PRACTICE QUESTION 1 =====\n\n")

# ---------------------------------------------------------
# Step 1: Input Expert Matrices
# ---------------------------------------------------------
E1 <- matrix(c(8,7,9,
               6,5,7,
               5,6,4), nrow=3, byrow=TRUE)

E2 <- matrix(c(7,6,8,
               9,8,9,
               6,5,6), nrow=3, byrow=TRUE)

E3 <- matrix(c(6,7,6,
               7,8,8,
               8,7,9), nrow=3, byrow=TRUE)

rownames(E1) <- rownames(E2) <- rownames(E3) <- c("A1","A2","A3")
colnames(E1) <- colnames(E2) <- colnames(E3) <- c("C1","C2","C3")

cat("=== Expert 1 ===\n"); print(E1)
cat("\n=== Expert 2 ===\n"); print(E2)
cat("\n=== Expert 3 ===\n"); print(E3)

# ---------------------------------------------------------
# Step 2: Simple Aggregation
# ---------------------------------------------------------
simple_agg <- (E1 + E2 + E3) / 3

cat("\n=== Simple Aggregated Matrix ===\n")
print(simple_agg)

# ---------------------------------------------------------
# Step 3: Weighted Aggregation
# ---------------------------------------------------------
weights <- c(0.4, 0.35, 0.25)

weighted_matrix <- weights[1]*E1 + weights[2]*E2 + weights[3]*E3

cat("\n=== Weighted Aggregated Matrix ===\n")
print(weighted_matrix)

# ---------------------------------------------------------
# Step 4: Score (Simple)
# ---------------------------------------------------------
score_simple <- rowSums(simple_agg)

cat("\n=== Scores (Simple) ===\n")
print(score_simple)

rank_simple <- rank(-score_simple)
names(rank_simple) <- rownames(simple_agg)

cat("\nRanking (Simple):\n")
print(rank_simple)

best_simple <- names(which.max(score_simple))
cat("Best (Simple):", best_simple, "\n")

# ---------------------------------------------------------
# Step 5: Score (Weighted)
# ---------------------------------------------------------
score_weighted <- rowSums(weighted_matrix)

cat("\n=== Scores (Weighted) ===\n")
print(score_weighted)

rank_weighted <- rank(-score_weighted)
names(rank_weighted) <- rownames(weighted_matrix)

cat("\nRanking (Weighted):\n")
print(rank_weighted)

best_weighted <- names(which.max(score_weighted))
cat("Best (Weighted):", best_weighted, "\n")

# ---------------------------------------------------------
# Step 6: Final Summary
# ---------------------------------------------------------
cat("\n=================================================\n")
cat("FINAL DECISION SUMMARY\n")
cat("=================================================\n")

cat("Best (Simple Aggregation)   :", best_simple, "\n")
cat("Best (Weighted Aggregation) :", best_weighted, "\n")


# ---------------------------------------------------------
# PRACTICE QUESTION 2
# ---------------------------------------------------------
cat("\n\n===== PRACTICE QUESTION 2 =====\n\n")

# ---------------------------------------------------------
# Step 1: Input Expert Matrices
# ---------------------------------------------------------
E1 <- matrix(c(9,8,7,
               5,6,5,
               6,5,6), nrow=3, byrow=TRUE)

E2 <- matrix(c(7,6,7,
               8,9,8,
               6,7,6), nrow=3, byrow=TRUE)

E3 <- matrix(c(6,7,6,
               7,8,7,
               9,8,9), nrow=3, byrow=TRUE)

rownames(E1) <- rownames(E2) <- rownames(E3) <- c("A1","A2","A3")
colnames(E1) <- colnames(E2) <- colnames(E3) <- c("C1","C2","C3")

cat("=== Expert 1 ===\n"); print(E1)
cat("\n=== Expert 2 ===\n"); print(E2)
cat("\n=== Expert 3 ===\n"); print(E3)

# ---------------------------------------------------------
# Step 2: Simple Aggregation
# ---------------------------------------------------------
simple_agg <- (E1 + E2 + E3) / 3

cat("\n=== Simple Aggregated Matrix ===\n")
print(simple_agg)

# ---------------------------------------------------------
# Step 3: Weighted Aggregation
# ---------------------------------------------------------
weights <- c(0.5, 0.3, 0.2)

weighted_matrix <- weights[1]*E1 + weights[2]*E2 + weights[3]*E3

cat("\n=== Weighted Aggregated Matrix ===\n")
print(weighted_matrix)

# ---------------------------------------------------------
# Step 4: Score (Simple)
# ---------------------------------------------------------
score_simple <- rowSums(simple_agg)

cat("\n=== Scores (Simple) ===\n")
print(score_simple)

rank_simple <- rank(-score_simple)
names(rank_simple) <- rownames(simple_agg)

cat("\nRanking (Simple):\n")
print(rank_simple)

best_simple <- names(which.max(score_simple))
cat("Best (Simple):", best_simple, "\n")

# ---------------------------------------------------------
# Step 5: Score (Weighted)
# ---------------------------------------------------------
score_weighted <- rowSums(weighted_matrix)

cat("\n=== Scores (Weighted) ===\n")
print(score_weighted)

rank_weighted <- rank(-score_weighted)
names(rank_weighted) <- rownames(weighted_matrix)

cat("\nRanking (Weighted):\n")
print(rank_weighted)

best_weighted <- names(which.max(score_weighted))
cat("Best (Weighted):", best_weighted, "\n")

# ---------------------------------------------------------
# Step 6: Final Summary
# ---------------------------------------------------------
cat("\n=================================================\n")
cat("FINAL DECISION SUMMARY\n")
cat("=================================================\n")

cat("Best (Simple Aggregation)   :", best_simple, "\n")
cat("Best (Weighted Aggregation) :", best_weighted, "\n")