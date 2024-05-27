Class {
	#name : #WsDependantViewApp,
	#superclass : #PjWebApplication,
	#traits : 'WsTSingleComponentApp',
	#classTraits : 'WsTSingleComponentApp classTrait',
	#category : #'WebST-Examples-DependantViews'
}

{ #category : #accessing }
WsDependantViewApp class >> rootComponentClass [ 
	^WsDependantViewComponent 
]
