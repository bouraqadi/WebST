Trait {
	#name : 'WsTJsCollectionTest',
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'testing' }
WsTJsCollectionTest >> assertJsCollection: collectionA hasSameElements: collectionB [

	| size |
	size := collectionA size.
	self assert: collectionB size equals: size.
	1 to: size do: [ :index | 
		self
			assert: (collectionA at: index)
			identicalTo: (collectionB at: index) ]
]

{ #category : 'tests' }
WsTJsCollectionTest >> jsCollection: jsCollection collect: aBlock [

	^(1 to: jsCollection size) collect: [ :index | 
	 aBlock value: (jsCollection at: index) ]
]

{ #category : 'tests' }
WsTJsCollectionTest >> jsCollection: jsCollection do: aBlock [
	1 to: jsCollection size do: [ : index |
		aBlock value: (jsCollection at: index)
	]
]

{ #category : 'tests' }
WsTJsCollectionTest >> jsCollection: jsCollection with: otherCollection do: aBlock [

	self assert: jsCollection size equals: otherCollection size.
	1 to: jsCollection size do: [ :index | 
	aBlock value: (jsCollection at: index) value: (otherCollection at: index) ]
]

{ #category : 'tests' }
WsTJsCollectionTest >> jsCollection: jsCollection withIndexDo: aBlock [

	1 to: jsCollection size do: [ :index | 
	aBlock value: (jsCollection at: index) value: index ]
]
