/************************
 This code is released under the terms of the GNU GPL, v2 (or any later version).
 The GNU GPL can be found in the file 'COPYING'.  Copyright Geoffrey French 1999-2001.
 ************************/
/*	by :					Geoffrey French
	application :		gSculpt
	last revision :	10/Jul/2000
	title :				Vector Widget for GTK
	puspose :			Composite widget for entering values into a 3D vector
*/

#ifndef __VECTORWIDGET_H
#define __VECTORWIDGET_H

#include <gtk/gtkwidget.h>

#include "Vector3.h"
#include "Point3.h"


/*
*******************************************************************************
											VectorWidget
*******************************************************************************
*/

class VectorWidget
{
private:
	Vector3 val;				//value
	GtkWidget *xentry, *yentry, *zentry, *box;		//the GTK widgets
	int size;					//size

	GtkSignalFunc sigFunc;
	gpointer sigData;

	bool blockChangedEvent;


public:
	VectorWidget(int s, const Vector3& v = Vector3());
	VectorWidget(GtkSignalFunc f, gpointer d,
					 int s, const Vector3& v = Vector3());
	~VectorWidget();

private:
	void constructorShared();		//shared constructor code
	void emitSignal();

public:
	void connect(GtkSignalFunc f, gpointer d);
	void disconnect();
	
	void activate();
	void deactivate();

	void setValue(const Vector3& v);
	Vector3 getVector3() const;
	Point3 getPoint3() const;

	GtkWidget* getWidget();
	
private:
	void update();

	static void x_changed(GtkWidget *widget, VectorWidget *klass);
	static void y_changed(GtkWidget *widget, VectorWidget *klass);
	static void z_changed(GtkWidget *widget, VectorWidget *klass);
};


#endif
