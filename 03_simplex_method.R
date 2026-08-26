# Vidisha - 22401172024
# =========================================================
# EXPERIMENT 03
# Aim: To solve a Linear Programming Problem (LPP) using the
# Simplex Method.
# =========================================================

# Step 1: Install and load required package
# install.packages("lpSolve")   # Run only once
library(lpSolve)


# =========================================================
# Problem Statement (Example)
# Maximize: Z = 3x1 + 5x2
# Subject to:
#   2x1 + 3x2 <= 8
#   2x1 + x2  <= 6
#   x1, x2 >= 0
# =========================================================

cat("===== EXAMPLE: Maximize Z = 3x1 + 5x2 =====\n")

# Step 2: Define Objective Function Coefficients
objective <- c(3, 5)

# Step 3: Define Constraint Coefficient Matrix
constraints <- matrix(c(2, 3,
                        2, 1),
                      nrow = 2,
                      byrow = TRUE)

# Step 4: Define Direction of Constraints
direction <- c("<=", "<=")

# Step 5: Define Right-Hand Side (RHS)
rhs <- c(8, 6)

# Step 6: Solve the LPP using Simplex Method
solution <- lp(direction = "max",
               objective.in = objective,
               const.mat = constraints,
               const.dir = direction,
               const.rhs = rhs)

# Step 7: Display Results
cat("\n----------------------------------------\n")
cat("Solution Status Code :", solution$status, "\n")

if (solution$status == 0) {
  cat("Optimal Solution Found!\n\n")
  cat("Optimal Value of Z =", solution$objval, "\n\n")
  
  for (i in 1:length(solution$solution)) {
    cat(paste("x", i, "=", solution$solution[i], "\n"))
  }
} else {
  cat("No Optimal Solution Found.\n")
}
cat("----------------------------------------\n")


# =========================================================
# PRACTICE QUESTIONS
# =========================================================

# ---------------------------------------------------------
# 1. Maximize: Z = 4x1 + 6x2
# Subject to:
#   x1 + 2x2  <= 8
#   3x1 + 2x2 <= 12
#   x1, x2 >= 0
# Expected Solution: (x1=2, x2=3, Z=26)
# ---------------------------------------------------------

cat("\n===== PRACTICE PROBLEM 1: Maximize Z = 4x1 + 6x2 =====\n")

# Step 2: Define Objective Function Coefficients
# Maximize Z = 4x1 + 6x2
objective <- c(4, 6)

# Step 3: Define Constraint Coefficient Matrix
constraints <- matrix(c(1, 2,
                        3, 2),
                      nrow = 2,
                      byrow = TRUE)

# Step 4: Define Direction of Constraints
direction <- c("<=", "<=")

# Step 5: Define RHS values
rhs <- c(8, 12)

# Step 6: Solve using Simplex Method
solution <- lp(direction = "max",
               objective.in = objective,
               const.mat = constraints,
               const.dir = direction,
               const.rhs = rhs)

# Step 7: Display Results
cat("\n----------------------------------------\n")
cat("Solution Status Code :", solution$status, "\n")

if (solution$status == 0) {
  cat("Optimal Solution Found!\n\n")
  cat("Optimal Value of Z =", solution$objval, "\n\n")
  
  for (i in 1:length(solution$solution)) {
    cat(paste("x", i, "=", solution$solution[i], "\n"))
  }
} else {
  cat("No Optimal Solution Found.\n")
}
cat("----------------------------------------\n")


# ---------------------------------------------------------
# 2. Minimize: Z = 5x1 + 3x2
# Subject to:
#   2x1 + x2 >= 6
#   x1 + x2  >= 4
#   x1, x2 >= 0
# Expected Solution: (x1=2, x2=2, Z=16)
# ---------------------------------------------------------

cat("\n===== PRACTICE PROBLEM 2: Minimize Z = 5x1 + 3x2 =====\n")

# Step 2: Define Objective Function Coefficients
# Minimize Z = 5x1 + 3x2
objective <- c(5, 3)

# Step 3: Define Constraint Coefficient Matrix
constraints <- matrix(c(2, 1,
                        1, 1),
                      nrow = 2,
                      byrow = TRUE)

# Step 4: Define Direction of Constraints
direction <- c(">=", ">=")

# Step 5: Define RHS values
rhs <- c(6, 4)

# Step 6: Solve using Simplex Method
solution <- lp(direction = "min",
               objective.in = objective,
               const.mat = constraints,
               const.dir = direction,
               const.rhs = rhs)

# Step 7: Display Results
cat("\n----------------------------------------\n")
cat("Solution Status Code :", solution$status, "\n")

if (solution$status == 0) {
  cat("Optimal Solution Found!\n\n")
  cat("Optimal Value of Z =", solution$objval, "\n\n")
  
  for (i in 1:length(solution$solution)) {
    cat(paste("x", i, "=", solution$solution[i], "\n"))
  }
} else {
  cat("No Optimal Solution Found.\n")
}
cat("----------------------------------------\n")