% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/riverplot.R
\name{plot.riverplot}
\alias{plot.riverplot}
\alias{riverplot}
\title{Create a Sankey plot}
\usage{
\method{plot}{riverplot}(x, ...)

riverplot(x, direction = "lr", lty = 0, default_style = NULL,
  gravity = "top", node_margin = 0.1, nodewidth = 1.5, plot_area = 0.5,
  nsteps = 50, add_mid_points = NULL, xscale = 1, yscale = "auto",
  mar = c(0, 0, 0, 0), add = FALSE, usr = NULL, fix.pdf = FALSE, ...)
}
\arguments{
\item{x}{An object of class riverplot}

\item{...}{any further parameters passed to riverplot() are appended to the default style}

\item{direction}{"lr" (left to right) or "rl" (right to left)}

\item{lty}{Line style to use}

\item{default_style}{default graphical style}

\item{gravity}{how the nodes are placed vertically. No effect if node
vertical positions are specified via \var{node_ypos} member}

\item{node_margin}{how much vertical space should be kept between the
nodes}

\item{nodewidth}{width of the node (relative to font size)}

\item{plot_area}{fraction of vertical space to be used as main plot area}

\item{nsteps}{number of interpolating steps in drawing the segments}

\item{add_mid_points}{attempt to get a smoother plot by adding additional
nodes. Set this parameter to \code{FALSE} if you are setting node
vertical position manually. If add_mid_points is equal to NULL (the
default), then the
mid points are added only if \var{node_ypos} is empty.}

\item{xscale}{scale the positions of the nodes by that factor. This can
be used to "squeeze" the diagram to the left as necessary.}

\item{yscale}{scale the edge width values by multiplying with this
factor. If \var{yscale} is equal to "auto", scaling is done
automatically such that the vertical size of the largest node is
approximately equal to 15% of the range of ypos (if present). 
If no \var{node_ypos} is specified in the riverplot object, no scaling is
done.
If \var{yscale} is equal to 1, no scaling is done.}

\item{mar}{margins to set (as accepted by par(mar=..)). Set to NULL if
you want the margins untouched.}

\item{add}{If TRUE, do not call plot.new(), but add to the existing plot.}

\item{usr}{coordinates at which to draw the plot in form (x0, x1, y0, y1).}

\item{fix.pdf}{Try to fix PDF output if it looks broken (with thin white lines). Don't use this option if you are using transparent colors.}
}
\value{
\code{riverplot} return invisibly a matrix containing the
      actual positions (in user coordinates) of the nodes drawn on the screen.
      Note that it also may contain additional, invisible nodes that have been
      created by the algorithm to better fit on the screen.
}
\description{
Create a Sankey plot
}
\details{
This functions create a Sankey plot given a riverplot object
(\code{plot} is just a wrapper for the \code{riverplot} function.
The object to be drawn is a list specifying the plot; see
the \code{\link{makeRiver}} function for exact specifications and
the \code{\link{riverplot.example}} to see how it can be created.
Whether or not the list used to plot is exactly of class
\code{riverplot-class} does not matter as long as it has the correct
contents.

Style information which is missing from the riverplot object \code{x} (for example, if the
node style is not specified for each node in the object) is taken from the \code{default.style} parameter.
See functions \code{\link{default.style}()} and
\code{\link{updateRiverplotStyle}()} to learn how to create and
modify the styles.

Whether or not the list used to plot is exactly of class
\code{riverplot-class} does not matter as long as it has the correct
contents. These functions here are for the convenience of checking that

The nodes are drawn from bottom to top in the order they are found in
the riverplot object. There is no clever algorithm for placing the nodes
minimizing the number of crossing edges yet; you need to manipulate the
object directly to achieve the desired effect.
}
\section{Known problems}{

There is a problem with transparency and PDFs.
In short, if you try to save your riverplot graphics as PDF, you will
observe thin, white vertical lines everywhere on the curves. The reasons
for that are unclear, but have something to do with PDF rendering (if you
generate EPS, the output looks good).

There is a kind of fix to that: use the fix.pdf=TRUE option. Unfortunately,
this solution does not work if you use transparent colors (you will have a
different kind of vertical lines). Unfortunately, I don't have a solution
for that problem yet.
}

\examples{
x <- riverplot.example()
plot(x)
plot(x, srt=90, lty=1)
}
\seealso{
default.style updateRiverplotStyle minard
}
