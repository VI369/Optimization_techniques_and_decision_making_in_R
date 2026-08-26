# Vidisha - 22401172024
# =========================================================
# EXPERIMENT 04
# Aim: Solution of the Integer Programming Problem using the
# Branch and Bound Technique.
# =========================================================

# Install package (run once)
# install.packages("lpSolve")

# Load library
library(lpSolve)


# =========================================================
# Problem Statement (Example)
# Maximize: Z = x + y
# Subject to:
#   2x + y <= 4
#   x + 2y <= 4
#   x, y >= 0 and x, y in Z (integers)
# =========================================================

cat("===== EXAMPLE: Maximize Z = x + y (Branch and Bound) =====\n\n")

# ---------------------------------------------------------
# STEP 1: Define LP Relaxation
# ---------------------------------------------------------
objective <- c(1, 1)

constraints <- matrix(c(2, 1,
                        1, 2),
                      nrow = 2, byrow = TRUE)

direction <- c("<=", "<=")
rhs <- c(4, 4)

# Solve LP Relaxation
lp_relax <- lp("max", objective, constraints, direction, rhs)

cat("LP Relaxation Solution:\n")
print(lp_relax$solution)
cat("Objective Value:", lp_relax$objval, "\n\n")

# ---------------------------------------------------------
# STEP 2: Branch 1 (x <= 1)
# ---------------------------------------------------------
constraints_b1 <- rbind(constraints, c(1, 0))
direction_b1 <- c("<=", "<=", "<=")
rhs_b1 <- c(4, 4, 1)

branch1 <- lp("max", objective, constraints_b1, direction_b1, rhs_b1, all.int = TRUE)

cat("Branch 1 Solution (x <= 1):\n")
print(branch1$solution)
cat("Objective Value:", branch1$objval, "\n\n")

# ---------------------------------------------------------
# STEP 3: Branch 2 (x >= 2)
# ---------------------------------------------------------
constraints_b2 <- rbind(constraints, c(1, 0))
direction_b2 <- c("<=", "<=", ">=")
rhs_b2 <- c(4, 4, 2)

branch2 <- lp("max", objective, constraints_b2, direction_b2, rhs_b2, all.int = TRUE)

cat("Branch 2 Solution (x >= 2):\n")
print(branch2$solution)
cat("Objective Value:", branch2$objval, "\n\n")

# ---------------------------------------------------------
# STEP 4: Direct Integer Solution
# ---------------------------------------------------------
result <- lp("max", objective, constraints, direction, rhs, all.int = TRUE)

cat("Final Integer Solution:\n")
print(result$solution)
cat("Objective Value:", result$objval, "\n")

# ---------------------------------------------------------
# STEP 5: Branch 2 (x >= 2)  [confirmation run]
# ---------------------------------------------------------
constraints_b2 <- rbind(constraints, c(1, 0))
direction_b2 <- c("<=", "<=", ">=")
rhs_b2 <- c(4, 4, 2)

branch2 <- lp("max", objective, constraints_b2, direction_b2, rhs_b2, all.int = TRUE)

cat("\n=== Branch 2: x >= 2 ===\n")
cat("Solution (x, y):", branch2$solution, "\n")
cat("Maximum Z:", branch2$objval, "\n\n")

# ---------------------------------------------------------
# STEP 6: Direct Integer Solution [confirmation run]
# ---------------------------------------------------------
result <- lp("max", objective, constraints, direction, rhs, all.int = TRUE)

cat("=== Direct Integer Solution ===\n")
cat("Optimal Solution (x, y):", result$solution, "\n")
cat("Maximum Z:", result$objval, "\n\n")

# ---------------------------------------------------------
# STEP 7: Summary of ALL Branches
# ---------------------------------------------------------
cat("=== Summary of All Solutions ===\n")

solutions <- rbind(
  branch1$solution,
  branch2$solution,
  result$solution
)

colnames(solutions) <- c("x", "y")
solutions <- as.data.frame(solutions)

# Add Z column (since Z = x + y here)
solutions$Z <- solutions$x + solutions$y

print(solutions)


# =========================================================
# PRACTICE QUESTIONS
# =========================================================

# ---------------------------------------------------------
# 1. Maximize: Z = 2x1 + x2
# Subject to:
#   x1 + 7x2   <= 28
#   14x1 + 4x2 <= 63
#   x1, x2 >= 0 and are integers.
# ---------------------------------------------------------

cat("\n\n===== PRACTICE PROBLEM 1: Maximize Z = 2x1 + x2 =====\n\n")

# Step 1: Define Problem
objective <- c(2, 1)

constraints <- matrix(c(1, 7,
                        14, 4),
                      nrow = 2, byrow = TRUE)

direction <- c("<=", "<=")
rhs <- c(28, 63)

# Step 2: LP Relaxation
lp_relax <- lp("max", objective, constraints, direction, rhs)

cat("=== LP Relaxation ===\n")
cat("Solution (x1, x2):", lp_relax$solution, "\n")
cat("Maximum Z:", lp_relax$objval, "\n\n")

# Step 3: Branch 1 (x1 <= 4)
constraints_b1 <- rbind(constraints, c(1, 0))
direction_b1 <- c("<=", "<=", "<=")
rhs_b1 <- c(28, 63, 4)

branch1 <- lp("max", objective, constraints_b1, direction_b1, rhs_b1, all.int = TRUE)

cat("=== Branch 1: x1 <= 4 ===\n")
cat("Solution:", branch1$solution, "\n")
cat("Z:", branch1$objval, "\n\n")

# Step 4: Branch 2 (x1 >= 5)
constraints_b2 <- rbind(constraints, c(1, 0))
direction_b2 <- c("<=", "<=", ">=")
rhs_b2 <- c(28, 63, 5)

branch2 <- lp("max", objective, constraints_b2, direction_b2, rhs_b2, all.int = TRUE)

cat("=== Branch 2: x1 >= 5 ===\n")
cat("Solution:", branch2$solution, "\n")
cat("Z:", branch2$objval, "\n\n")

# Step 5: Direct Integer Solution
result <- lp("max", objective, constraints, direction, rhs, all.int = TRUE)

cat("=== Direct Integer Solution ===\n")
cat("Solution:", result$solution, "\n")
cat("Z:", result$objval, "\n\n")

# Step 6: Summary
solutions <- rbind(branch1$solution, branch2$solution, result$solution)
colnames(solutions) <- c("x1", "x2")
solutions <- as.data.frame(solutions)
solutions$Z <- 2*solutions$x1 + solutions$x2

print(solutions)


# ---------------------------------------------------------
# 2. Maximize: Z = x1 + x2
# Subject to:
#   3x1 + 2x2 <= 12
#   x2 <= 2
#   x1, x2 >= 0 and are integers.
# ---------------------------------------------------------

cat("\n\n===== PRACTICE PROBLEM 2: Maximize Z = x1 + x2 =====\n\n")

# Step 1: Define Problem
objective <- c(1, 1)

constraints <- matrix(c(3, 2,
                        0, 1),
                      nrow = 2, byrow = TRUE)

direction <- c("<=", "<=")
rhs <- c(12, 2)

# Step 2: LP Relaxation
lp_relax <- lp("max", objective, constraints, direction, rhs)

cat("=== LP Relaxation ===\n")
cat("Solution (x1, x2):", lp_relax$solution, "\n")
cat("Maximum Z:", lp_relax$objval, "\n\n")

# Step 3: Branch 1 (x1 <= 3)
constraints_b1 <- rbind(constraints, c(1, 0))
direction_b1 <- c("<=", "<=", "<=")
rhs_b1 <- c(12, 2, 3)

branch1 <- lp("max", objective, constraints_b1, direction_b1, rhs_b1, all.int = TRUE)

cat("=== Branch 1: x1 <= 3 ===\n")
cat("Solution:", branch1$solution, "\n")
cat("Z:", branch1$objval, "\n\n")

# Step 4: Branch 2 (x1 >= 4)
constraints_b2 <- rbind(constraints, c(1, 0))
direction_b2 <- c("<=", "<=", ">=")
rhs_b2 <- c(12, 2, 4)

branch2 <- lp("max", objective, constraints_b2, direction_b2, rhs_b2, all.int = TRUE)

cat("=== Branch 2: x1 >= 4 ===\n")
cat("Solution:", branch2$solution, "\n")
cat("Z:", branch2$objval, "\n\n")

# Step 5: Direct Integer Solution
result <- lp("max", objective, constraints, direction, rhs, all.int = TRUE)

cat("=== Direct Integer Solution ===\n")
cat("Solution:", result$solution, "\n")
cat("Z:", result$objval, "\n\n")

# Step 6: Summary
solutions <- rbind(branch1$solution, branch2$solution, result$solution)
colnames(solutions) <- c("x1", "x2")
solutions <- as.data.frame(solutions)
solutions$Z <- solutions$x1 + solutions$x2

print(solutions)