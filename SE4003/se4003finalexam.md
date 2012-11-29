# SE4003 Systems Software Engineering
## Final Exam

**Directions:** Complete all six questions below as well as the bonus question if desired. The exam is worth 15 points total and is open book/notes. Cite references properly, and state any assumptions.

### Question 1 (3 pts)
You are a member of the Systems Engineering IPT for a new Unmanned Aerial System (UAS). Preliminary solution-neutral activity models that describe the UAS desired functionality have been completed. Your colleagues on the IPT are working with the results of the first round of requirements elicitation with the customer, and a system requirements document is now being developed. You suggest that software engineers be included in the development of the document, but some of your colleagues suggest that it is still too premature to ask for their involvement. Their arguments are as follows:

- “We haven’t even decided yet which functions will be implemented by hardware, and which by software, so there is nothing for them to really do yet.”
- “The software engineers are detail-oriented; they are going to want to incorporate detailed specifications that may constrain the requirements document too much at this point.”

What counterpoints might be offered to justify a position for including software engineers this early in the process? Which position are you more inclined to support and why?

### Question 2.
Refer to Figure 1 in IEEE Standard 1471 (reprinted below).

1. (1 pt) [Identify](http://www.iso-architecture.org/ieee-1471/cm/) the notation (*language*) and type of *diagram* that were used to create this model.
2. (2 pts) Stepping through the diagram one element pair and relationship at a time, write a natural language description of each relationship. Include multiplicity in your written explanation, e.g. “One system fulfills many missions.” You may capture relationships in just one direction, i.e., you do not have to also write “Many missions are fulfilled by one system.” *Use proper English grammar, as if you were explaining the diagram to someone else.*

### Question3. (2 pts). 
Define software [coupling and cohesion](http://c2.com/cgi/wiki?CouplingAndCohesion). How do these design considerations impact software quality?

### Question 4. (2 pts). 
Describe some challenges for reusing software (technical, programmatic or both). Which of these are more prevalent for DoD. Why?

### Question 5.
Provide short answers to all parts below.

1. (1 pt) Give an example of a safety-critical software function in a system you are familiar with (either from work or everyday life).
2. (1 pt) Name a potential hazard pertaining to this function, and a potential mishap that can occur if the hazard is not addressed.
3. (1 pt) What can be done to reduce the likelihood of hazardous failure modes, throughout the development of the system in which the software is embedded?

### Question 6 (2 pts).
What are the shortfalls of using lines of code as an indication of software size and complexity? Describe other available options.

### Bonus Question. 
Answer one or more parts below.

1. (2 pts) What are [formal methods](http://en.wikipedia.org/wiki/Formal_methods)? Describe how formal specification, model checking and theorem proving can each be used in software development. What are the benefits and limitations?
2. (1 pt) Which of the following [propositional formulas](http://www.inf.unibz.it/~franconi/teaching/propcalc/) represents the sentence *‘It will rain today in the morning or in the afternoon; if the former, the golf tournament will be rescheduled’*, where:

> - p means *‘It will rain today in the morning’*
> - q means *‘It will rain today in the afternoon’*
> - r means *‘The golf tournament will be rescheduled’*

1. ¬p → q V r
2. p V q → r
3. (p → q) Λ (p V r)
4. p V ¬q → r
5. (p V q) Λ (p → r)