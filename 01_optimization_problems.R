# Vidisha - 22401172024
# =========================================================
# EXPERIMENT 01
# Aim: To study optimization problems in different engineering
# fields and identify objective functions, decision variables,and constraints.
# =========================================================

cat("EXPERIMENT 1: STUDY OF OPTIMIZATION PROBLEMS IN ENGINEERING\n\n")

# ---------------------------------------------------------
# Example 1: Mechanical Engineering - Beam Design
# ---------------------------------------------------------
cat("1. Mechanical Engineering Problem: Beam Design\n")

length <- 5
area <- 0.02
density <- 7850

stress <- 200
stress_limit <- 250

weight <- density * area * length 

cat("Decision Variables: length, area\n")
cat("Objective Function: Minimize Weight\n")
cat("Weight of Beam =", weight, "kg\n")
cat("Constraint: Stress <=", stress_limit, "MPa\n")
cat("Stress Satisfied:", stress <= stress_limit, "\n")

# ---------------------------------------------------------
# Example 2: Electrical Engineering - Power Loss Minimization
# ---------------------------------------------------------
cat("\n2. Electrical Engineering Problem: Power Loss Minimization\n")

# Decision Variables
current <- 10        # Amperes
resistance <- 5       # Ohms

# Objective Function: Power Loss = I^2 * R
power_loss <- current^2 * resistance

cat("Decision Variables: current\n")
cat("Objective Function: Minimize Power Loss\n")
cat("Power Loss =", power_loss, "Watts\n")

# Constraints
max_current <- 15
cat("Constraint: Current <=", max_current, "A\n")
cat("Constraint Satisfied:", current <= max_current, "\n\n")

# ---------------------------------------------------------
# Example 3: Civil Engineering - Construction Cost Minimization
# ---------------------------------------------------------
cat("3. Civil Engineering Problem: Construction Cost Minimization\n")

# Decision Variables
cement <- 300   # kg
steel  <- 100   # kg

# Objective Function: Total Cost
cost <- 7 * cement + 60 * steel

cat("Decision Variables: cement, steel\n")
cat("Objective Function: Minimize Construction Cost\n")
cat("Total Cost = Rs.", cost, "\n")

# Constraints
min_strength <- 400
strength <- 450

cat("Constraint: Strength >=", min_strength, "\n")
cat("Strength Satisfied:", strength >= min_strength, "\n\n")

# ---------------------------------------------------------
# Example 4: Production/Industrial Engineering - Profit Maximization
# ---------------------------------------------------------
cat("4. Production Engineering Problem: Profit Maximization\n")

# Decision Variables
x <- 40    # units of product A
y <- 30    # units of product B

# Objective Function: Profit
profit <- 50 * x + 40 * y

cat("Decision Variables: x (Product A), y (Product B)\n")
cat("Objective Function: Maximize Profit\n")
cat("Total Profit = Rs.", profit, "\n")

# Constraints
machine_hours <- 120
used_hours <- 2 * x + y

cat("Constraint: Machine Hours <=", machine_hours, "\n")
cat("Used Hours =", used_hours, "\n")
cat("Constraint Satisfied:", used_hours <= machine_hours, "\n")


# =========================================================
# PRACTICE QUESTIONS BASED ON EXPERIMENT 01
# =========================================================

# ---------------------------------------------------------
# Problem 1: Beam design with additional max length constraint
# ---------------------------------------------------------
cat("\n\n----- PRACTICE PROBLEM 1 -----\n")
cat("Beam Design: Minimum Weight with Length Constraint\n")

# Decision Variables
length <- 5        # meters
area <- 0.02        # m^2
density <- 7850     # kg/m^3

# Constraints
stress <- 200
stress_limit <- 250
max_length <- 6     # meters

# Objective Function (Weight)
weight <- density * area * length

# Output
cat("Weight of Beam =", weight, "kg\n")
cat("Constraint 1: Stress <=", stress_limit, "MPa\n")
cat("Stress Satisfied:", stress <= stress_limit, "\n")
cat("Constraint 2: Length <=", max_length, "m\n")
cat("Length Satisfied:", length <= max_length, "\n\n")

# ---------------------------------------------------------
# Problem 2: Beam design - minimize cost instead of weight
# ---------------------------------------------------------
cat("----- PRACTICE PROBLEM 2 -----\n")
cat("Beam Design: Cost Minimization\n")

# Decision Variables
length <- 5
area <- 0.02
density <- 7850

# Material cost
cost_per_kg <- 60   # Rs per kg

# Weight calculation
weight <- density * area * length

# Objective Function: Cost
total_cost <- weight * cost_per_kg

# Constraint
stress <- 200
stress_limit <- 250

# Output
cat("Weight =", weight, "kg\n")
cat("Total Cost = Rs.", total_cost, "\n")
cat("Stress Constraint Satisfied:", stress <= stress_limit, "\n\n")

# ---------------------------------------------------------
# Problem 3: Electrical power loss minimization
# ---------------------------------------------------------
cat("----- PRACTICE PROBLEM 3 -----\n")
cat("Electrical Engineering Problem: Power Loss Minimization\n")

# Decision Variables
current <- 8        # Amperes
resistance <- 4      # Ohms

# Objective Function
power_loss <- current^2 * resistance

# Constraint
max_current <- 10

# Output
cat("Power Loss =", power_loss, "Watts\n")
cat("Constraint: Current <=", max_current, "A\n")
cat("Constraint Satisfied:", current <= max_current, "\n")