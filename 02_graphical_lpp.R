# Vidisha - 22401172024
# =========================================================
# EXPERIMENT 02
# Aim: To understand how real-life engineering design problems
# can be formulated as Linear Programming Problems (LPP) and
# solve two-variable optimization problems using the graphical
# method.
# =========================================================

library(ggplot2)

# =========================================================
# Example 1: Mechanical Engineering
# A workshop manufactures two machine parts, A and B.
#
# Maximize: Z = 300x + 200y
# Subject to:
#   2x + y <= 100  (Machine hours)
#   x + y  <= 80   (Labor hours)
#   x, y >= 0
# =========================================================

cat("===== EXAMPLE 1: Mechanical Engineering (Machine Parts) =====\n")

# Define x values
x <- seq(0, 100, length.out = 400)

# Constraint equations
y1 <- 100 - 2 * x     # 2x + y = 100
y2 <- 80 - x           # x + y = 80

# Data frame for constraint lines
df <- data.frame(x, y1, y2)

# Corner Points 
feasible <- data.frame(
  x = c(0, 0, 20, 50),
  y = c(0, 80, 60, 0)
)

# Obj. Func.
# Z = 300x + 200y
feasible$Z <- 300 * feasible$x + 200 * feasible$y

cat("----------- Corner Points -----------\n")
print(feasible)

# Optimal Solution
optimal <- feasible[which.max(feasible$Z), ]

cat("\n----------- Optimal Solution -----------\n")
print(optimal)

# Labels for the graph
feasible$label <- paste0("(", feasible$x, ", ", feasible$y,
                         ")\nZ=", feasible$Z)

# Plot 
p1 <- ggplot() +
  geom_polygon(
    data = feasible,
    aes(x = x, y = y),
    fill = "lightgreen",
    alpha = 0.4
  ) +
  geom_line(
    data = df,
    aes(x = x, y = y1),
    color = "blue",
    linewidth = 1
  ) +
  geom_line(
    data = df,
    aes(x = x, y = y2),
    color = "red",
    linewidth = 1
  ) +
  geom_point(
    data = feasible,
    aes(x = x, y = y),
    size = 4
  ) +
  geom_point(
    data = optimal,
    aes(x = x, y = y),
    color = "red",
    size = 6
  ) +
  geom_label(
    data = feasible,
    aes(x = x, y = y, label = label),
    size = 4
  ) +
  labs(
    title = "Graphical Solution of LPP",
    x = "Part A",
    y = "Part B"
  ) +
  theme_minimal() +
  coord_cartesian(xlim = c(0, 100), ylim = c(0, 100))

print(p1)

cat("\nResult: The graphical method successfully determined the optimal\n")
cat("production plan. Maximum profit occurs at the intersection of constraints.\n\n")


# =========================================================
# PRACTICE QUESTIONS
# =========================================================

# ---------------------------------------------------------
# Problem 1 (Civil Engineering)
# A contractor uses two materials for road construction.
# Cost per ton: Material A = Rs.500, Material B = Rs.400
# Constraints:
#   3x + 2y <= 60
#   x + y <= 25
# Minimize cost
# ---------------------------------------------------------

cat("===== PRACTICE PROBLEM 1: Civil Engineering (Road Construction) =====\n")

x <- seq(0, 30, length.out = 400)

# Constraint lines
y1 <- (60 - 3*x)/2    # 3x + 2y = 60
y2 <- 25 - x            # x + y = 25

df <- data.frame(x, y1, y2)

# Corner points of feasible region
feasible <- data.frame(
  x = c(0, 0, 20, 10),
  y = c(0, 25, 0, 15)
)

# Objective function (Cost)
feasible$Z <- 500*feasible$x + 400*feasible$y

cat("----- Corner Points -----\n")
print(feasible)

# Optimal Solution (Minimum Cost)
optimal <- feasible[which.min(feasible$Z), ]

cat("\n----- Optimal Solution (Minimum Cost) -----\n")
print(optimal)

# Labels
feasible$label <- paste0("(", feasible$x, ", ", feasible$y, ")\nZ=", feasible$Z)

# Plot
p2 <- ggplot() +
  geom_polygon(data = feasible,
               aes(x = x, y = y),
               fill = "lightgreen",
               alpha = 0.4) +
  
  geom_line(data = df, aes(x = x, y = y1),
            color = "blue", linewidth = 1) +
  
  geom_line(data = df, aes(x = x, y = y2),
            color = "red", linewidth = 1) +
  
  geom_point(data = feasible,
             aes(x = x, y = y),
             size = 4) +
  
  geom_point(data = optimal,
             aes(x = x, y = y),
             color = "red",
             size = 6) +
  
  geom_label(data = feasible,
             aes(x = x, y = y, label = label),
             size = 4) +
  
  labs(title = "Graphical Solution of LPP (Civil Engineering)",
       x = "Material A (tons)",
       y = "Material B (tons)") +
  
  theme_minimal() +
  coord_cartesian(xlim = c(0, 30),
                  ylim = c(0, 30))

print(p2)


# ---------------------------------------------------------
# Problem 2 (Electrical Engineering)
# A company produces two types of batteries.
# Profit: Type 1 = Rs.40, Type 2 = Rs.30
# Constraints:
#   2x + y <= 100
#   x + 3y <= 90
# Maximize profit
# ---------------------------------------------------------

cat("\n\n===== PRACTICE PROBLEM 2: Electrical Engineering (Batteries) =====\n")

x <- seq(0, 60, length.out = 400)

# Constraint lines
y1 <- 100 - 2*x         # 2x + y = 100
y2 <- (90 - x)/3         # x + 3y = 90

df <- data.frame(x, y1, y2)

# Corner points
feasible <- data.frame(
  x = c(0, 0, 50, 42),
  y = c(0, 30, 0, 16)
)

# Objective function (Profit)
feasible$Z <- 40*feasible$x + 30*feasible$y

cat("----- Corner Points -----\n")
print(feasible)

# Optimal Solution (Maximum Profit)
optimal <- feasible[which.max(feasible$Z), ]

cat("\n----- Optimal Solution (Maximum Profit) -----\n")
print(optimal)

# Labels for graph
feasible$label <- paste0("(", feasible$x, ", ", feasible$y, ")\nZ=", feasible$Z)

# Plot
p3 <- ggplot() +
  geom_polygon(data = feasible,
               aes(x = x, y = y),
               fill = "lightgreen",
               alpha = 0.4) +
  
  geom_line(data = df, aes(x = x, y = y1),
            color = "blue", linewidth = 1) +
  
  geom_line(data = df, aes(x = x, y = y2),
            color = "red", linewidth = 1) +
  
  geom_point(data = feasible,
             aes(x = x, y = y),
             size = 4) +
  
  geom_point(data = optimal,
             aes(x = x, y = y),
             color = "red",
             size = 6) +
  
  geom_label(data = feasible,
             aes(x = x, y = y, label = label),
             size = 4) +
  
  labs(title = "Graphical Solution of LPP (Electrical Engineering)",
       x = "Type 1 Batteries (x)",
       y = "Type 2 Batteries (y)") +
  
  theme_minimal() +
  coord_cartesian(xlim = c(0, 60),
                  ylim = c(0, 40))

print(p3)