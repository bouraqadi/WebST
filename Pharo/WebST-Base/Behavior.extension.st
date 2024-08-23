Extension { #name : 'Behavior' }

{ #category : '*WebST-Base' }
Behavior >> findComponentClassesWith: aComponentClassFinder [

	^ aComponentClassFinder analyzeClass: self
]
