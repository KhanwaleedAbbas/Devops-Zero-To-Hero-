# GIT Branching Strategy

## What is Branch? 
   It is a separtion. For example if you want to add any feature in your existing app then create a new branch and test it there before you eventually put it into main or master branch.

## Strategy
  **1. Git Flow**
  Git Flow is one of the most popular and structured branching strategies. It introduces specific branches for different purposes in the development process.
  **Main Branches:**
  main (or master): This branch holds the production-ready code. It is always stable.
  develop: This is where the latest development changes are merged and tested. It is like the integration branch.
  **Supporting Branches:**
  feature/: Branches off from develop for new features or improvements.
  release/: Once develop has enough features for a release, you create a release branch to prepare for production (bug fixes, documentation, etc.).

  **Workflow:**
  You develop features in the feature/ branches, then merge into develop.
  When you’re ready for a release, create a release/ branch from develop, finalize it, and then merge it into both main and develop.
  If you find critical bugs in production, fix them in a hotfix/ branch, then merge them back into both main and develop.

  **2. GitHub Flow**
  GitHub Flow is simpler and more lightweight compared to Git Flow. It's typically used for continuous delivery and projects where you want to deploy frequently.
  **Main Branch:**
  The main branch is always deployable. All changes are made via pull requests (PRs) and merged into the main branch after review.
  **Feature Branches:**
  New work is done on feature branches (e.g., feature/login-page) that branch off from main.
  Once the feature is completed, a pull request is opened to review and merge the changes into main.

  **Workflow:**
  Developers create feature branches off main.
  Once the work is complete, they open a pull request for review.
  After the review and testing, the changes are merged back into main.
  The code is then immediately deployed, making this strategy suitable for continuous deployment.

  **3. Feature Branch Workflow**
  In this strategy, developers create a separate branch for each new feature or bug fix. These branches are then merged back into the main branch once they are complete.

  **Main Branch:**
  Always contains production-ready code.
  Feature Branches: Each developer works on a new feature or bug fix in its own branch, then merges it into main (or develop).

  **Workflow:**
  Developers create a feature branch from main.
  After completing the work, they open a pull request to merge the feature back into the main branch.
  Code reviews and testing are done before merging.
  This is ideal for teams working on multiple isolated features simultaneously.

## What is release Branch?
A release branch is created from the main (or develop) branch when your project is feature complete and ready for testing and final polishing before going live.
  It allows developers to:
  Freeze new feature development.
  Focus on bug fixes, stability, and version updates (like changing version numbers, updating documentation, etc.).
  Prepare for the deployment of a stable version.

**Example Scenario**
Let’s say you’re building an e-commerce site.
- Your develop branch has new features like “wishlist,” “discount coupons,” and “dark mode.”
- The business decides to release version v2.0 with wishlist + coupons (but not dark mode).
- You create a release/v2.0 branch.
- You test, fix small issues, update version numbers, and deploy it.
- Once stable → you merge into main and tag it as v2.0.

## What is hotfix branch?
 A hotfix branch is a temporary branch used to quickly fix critical bugs or issues found in the production (main) environment — without waiting for the next release cycle.
A hotfix branch is created directly from the main (or master) branch when something breaks in production — for example:
  - A serious bug after deployment
  - A security vulnerability
  - A configuration or logic error affecting users
The goal is to apply the fix quickly, test it, and deploy it to production without disturbing ongoing development on other branches.

**Example Scenario**
Imagine your website crashes when users try to make a payment.
- Production branch: main
- Current running version: v2.0
- You quickly create a hotfix/v2.0.1 branch
- Fix the bug in the payment module
- Test → Merge → Deploy to production
- Merge back into develop to keep codebases aligned
