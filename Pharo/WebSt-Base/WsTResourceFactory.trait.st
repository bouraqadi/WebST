Trait {
	#name : #WsTResourceFactory,
	#category : #'WebSt-Base-Views'
}

{ #category : #adding }
WsTResourceFactory >> addCssAt: urlString [

	self addResourceClass: WsCssLink  url: urlString.

]

{ #category : #adding }
WsTResourceFactory >> addJsAt: urlString [

	self addResourceClass: WsJsScript url: urlString
]

{ #category : #adding }
WsTResourceFactory >> addResource: aResource [
	self explicitRequirement 
]

{ #category : #adding }
WsTResourceFactory >> addResourceClass: resourceClass url: urlString [

	| aResource |
	aResource := resourceClass url: urlString.
	self addResource: aResource
]

{ #category : #adding }
WsTResourceFactory >> addResourcesAll: allResources [ 
	allResources do: [: each | self addResource: each]
]
