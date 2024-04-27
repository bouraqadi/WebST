Class {
	#name : #WsDependantViewApp,
	#superclass : #PjWebApplication,
	#traits : 'WsTComponentApp',
	#classTraits : 'WsTComponentApp classTrait',
	#category : #'WebSt-Examples-DependantViews'
}

{ #category : #accessing }
WsDependantViewApp class >> rootComponentClass [ 
	^WsDependantViewComponent 
]
