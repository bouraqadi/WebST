Class {
	#name : 'WsComponentResourcesTest',
	#superclass : 'TestCase',
	#category : 'WebST-Tests-Resources',
	#package : 'WebST-Tests',
	#tag : 'Resources'
}

{ #category : 'tests' }
WsComponentResourcesTest >> testAppGlobalResources [

	| appHtml |
	appHtml := WsAppNotRenderingSubComponent html.
	WsLeafComponent resources
		collect: [ :aResource | '*' , aResource url , '*' ]
		thenDo: [ :pattern | self assert: (pattern match: appHtml) ]
]

{ #category : 'tests' }
WsComponentResourcesTest >> testComponentClasses [

	| actualClasses |
	actualClasses := WsComponentClassFinder allComponentClassesFrom:
		                 WsComponentNotRenderingSubComponent.
	self assertCollection: actualClasses includesAll: { WsLeafComponent }
]

{ #category : 'tests' }
WsComponentResourcesTest >> testComponentResources [

	self
		assertCollection:
			WsComponentNotRenderingSubComponent resources
		includesAll: WsLeafComponent resources
]

{ #category : 'tests' }
WsComponentResourcesTest >> testViewGlobalResources [

	self
		assertCollection:
			WsViewNotRenderingSubComponent allGlobalResources
		includesAll: WsLeafComponent resources
]
