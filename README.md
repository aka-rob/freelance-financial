### _UPDATE_

This program was written years ago - now that I'm getting into Python/Flask/Django, my goal is to recreate this in Python in the coming weeks/months!

# Freelance Financial

#### Description

The purpose of this application is to give freelance professionals a better idea for cash flow and profitability. This isn't about taxes, it's about *cash*!

### Background

#### Situation

Freelancers can focus too much on revenue and not on the amount they take home (profit). What good is a job if your expenses equal what you're paid? The goal of this project was to provide a filter for freelancers to review their current and upcoming work in a way that showed them how they can maximize their profit.

#### Actions

The goal of version one (v1) is to develop a minimum viable product with core functionality. Key user stories are:

  * As a user, I want to be able to track my freelance jobs so I know how business is going.
  * As a user, I want to know what directly related expenses I incurred so I can calculate my profit.
  * As a user, I want to get insight on my most profitable jobs so I can focus my efforts on what makes me the most money.

With these in mind, Rails provides a great fit as a v1 language that has the flexibility to become a backend API and allow for a JavaScript framework in v2 to manage the frontend. Service scripts are used to allow the controllers to only manage params. This also prepares the application to move to an API. `Job` and `Expense` models manage key information with the `Expense` belonging to the `Job` model. Business logic is added to the `Job` model to provide profit information about `jobs`. Current month, monthly average, and current year resides in `jobs_helper.rb` to allow the view to show a profit dashboard.

Finally, Devise and Pundit are used for user authentication and authorization, respectfully. Bootstrap 4.0 is implemented to make the views less damaging to the retinas.

#### Results

The user stories have been completed and core functionality achieved. Any freelancer will now have a better understanding of how their business is running.

#### Next Steps

  * Migrate to Rails API with Vue.js frontend
  * Replace Bootstrap CSS with Tailwind or Semantic-UI
  * Provide user with visual representations of profitability
  * Add Stripe functionality to allow for subscription based service
