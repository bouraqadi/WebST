Class {
	#name : 'WsView',
	#superclass : 'WsElement',
	#category : 'WebST-Base-Views',
	#package : 'WebST-Base',
	#tag : 'Views'
}

{ #category : 'accessing' }
WsView class >> allGlobalResources [

	^ self new allGlobalResources
]

{ #category : 'analyzing' }
WsView class >> findComponentClassesWith: aComponentClassFinder [

	aComponentClassFinder analyzeViewClass: self
]

{ #category : 'accessing' }
WsView class >> referencedComponentClasses [

	^ self referencedClasses select: [ :each |
		  each inheritsFrom: WsComponent ]
]

{ #category : 'rendering' }
WsView class >> renderOn: html [

	html render: self new
]

{ #category : 'rendering' }
WsView class >> renderOn: renderer with: initBlock [ 
	renderer renderViewClass: self with: initBlock
]

{ #category : 'accessing' }
WsView >> allGlobalResources [

	^(self renderClass render: self)
		  globalResources
]

{ #category : 'rendering' }
WsView >> html [

	^self renderClass htmlWithLocalResourcesFrom: self
]

{ #category : 'rendering' }
WsView >> renderOn: html [
	html renderView: self
]

{ #category : 'rendering' }
WsView >> renderOuterHtmlOn: html [

	self subclassResponsibility
]

{ #category : 'accessing' }
WsView >> resources [

	^ #(  )
]
