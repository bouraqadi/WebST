Trait {
	#name : 'WsTResourceFactory',
	#category : 'WebST-Base-Views',
	#package : 'WebST-Base',
	#tag : 'Views'
}

{ #category : 'adding' }
WsTResourceFactory >> addCssAt: urlString [

	self addResourceClass: WsCssLink  pathString: urlString.

]

{ #category : 'adding' }
WsTResourceFactory >> addCssAtFixedPathString: urlString [

	self addResourceClass: WsCssLink fixedPathString: urlString
]

{ #category : 'adding' }
WsTResourceFactory >> addJsAt: urlString [

	self addResourceClass: WsJsScript pathString: urlString
]

{ #category : 'adding' }
WsTResourceFactory >> addJsAtFixedPathString: urlString [

	self addResourceClass: WsJsScript fixedPathString: urlString
]

{ #category : 'adding' }
WsTResourceFactory >> addResource: aResource [
	self explicitRequirement 
]

{ #category : 'adding' }
WsTResourceFactory >> addResourceClass: resourceClass fixedPathString: urlString [

	| aResource |
	aResource := resourceClass fixedPathString: urlString.
	self addResource: aResource
]

{ #category : 'adding' }
WsTResourceFactory >> addResourceClass: resourceClass pathString: urlString [

	| aResource |
	aResource := resourceClass pathString: urlString.
	self addResource: aResource
]

{ #category : 'adding' }
WsTResourceFactory >> addResourcesAll: allResources [ 
	allResources do: [: each | self addResource: each]
]
